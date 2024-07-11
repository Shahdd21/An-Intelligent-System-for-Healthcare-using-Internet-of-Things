#define USE_ARDUINO_INTERRUPTS true
#include <ESP8266WiFi.h>
#include <WiFiClientSecure.h>
#include "DHT.h"


#define DHTTYPE DHT22
#define DHTPin D3 
DHT dht(DHTPin, DHTTYPE); 

const int analogPin = A0;

#define MQ8Pin D1 
#define MQ6Pin D0 
#define HRPin D2 

int Signal; 
int Threshold = 550; 

#define ON_Board_LED 2 

const char* ssid = "Sarsoor"; 
const char* password = "12345678"; 

const char* host = "script.google.com"; 
const int httpsPort = 443; 

WiFiClientSecure client; 

String GAS_ID = "AKfycbwcaAgpZnNDLnRVLPzZxdTsN1kEiq8FuD88CPn_LTxv1_bJ1dI9IZxZofI8OIgvRAFktg"; 

void setup() {
  pinMode(LED_BUILTIN, OUTPUT); 
  Serial.begin(9600); 

  dht.begin(); 
  delay(500);

  WiFi.begin(ssid, password); 
  Serial.println("");

  pinMode(ON_Board_LED, OUTPUT); 
  digitalWrite(ON_Board_LED, HIGH); 
  Serial.print("Connecting to ");
  Serial.print(ssid);
  Serial.println(" ...");

  int attempts = 0;
  while (WiFi.status() != WL_CONNECTED) {
    digitalWrite(ON_Board_LED, LOW); 
    delay(250);
    digitalWrite(ON_Board_LED, HIGH);
    delay(250);
    Serial.print(".");
    if (++attempts > 20) { 
      Serial.println("Failed to connect to WiFi!");
      return;
    }
  }

  digitalWrite(ON_Board_LED, HIGH); 
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  client.setInsecure();

  pinMode(MQ8Pin, OUTPUT);
  digitalWrite(MQ8Pin, LOW);

  pinMode(MQ6Pin, OUTPUT);
  digitalWrite(MQ6Pin, LOW);

  pinMode(HRPin, OUTPUT);
  digitalWrite(HRPin, LOW);
}

void loop() {
  float h = dht.readHumidity();
  float t = dht.readTemperature();

  if (isnan(h) || isnan(t)) {
    Serial.println("Failed to read from DHT sensor!");
    delay(1000);
    return;
  }

  digitalWrite(MQ8Pin,HIGH);
  delay(1000);
  int mq8Value = analogRead(analogPin);
  digitalWrite(MQ8Pin,LOW);
  delay(1000);

  digitalWrite(MQ6Pin,HIGH);
  delay(1000);
  int mq6Value = analogRead(analogPin);
  digitalWrite(MQ6Pin,LOW);
  delay(1000);

  digitalWrite(HRPin,HIGH);
  delay(1000);
  int Signal = analogRead(analogPin);
  digitalWrite(HRPin,LOW);
  delay(1000);

 
  String Temp = "Temperature: " + String(t) + " °C";
  String Humi = "Humidity: " + String(h) + " %";
  String MQ8 = "MQ8: " + String(mq8Value);
  String MQ6 = "MQ6: " + String(mq6Value);
  String HR = "Heart Rate: " + String(Signal);

  Serial.println(Temp);
  Serial.println(Humi);
  Serial.println(MQ8);
  Serial.println(MQ6);
  Serial.println(HR);

  sendData(t, h, mq8Value, mq6Value, Signal);
  delay(500); 
}

void sendData(float tem, float hum, int mq8, int mq6, int hr) {
  Serial.println("Connecting to ");
  Serial.println(host);

  if (!client.connect(host, httpsPort)) {
    Serial.println("Connection failed!");
    return;
  }

  String string_temperature = String(tem);
  String string_humidity = String(hum);
  String string_mq8 = String(mq8);
  String string_mq6 = String(mq6);
  String string_hr = String(hr);

  String url = "/macros/s/" + GAS_ID + "/exec?temperature=" + string_temperature +
               "&humidity=" + string_humidity + "&mq8=" + string_mq8 + 
               "&mq6=" + string_mq6 + "&hr=" + string_hr;
  Serial.print("Requesting URL: ");
  Serial.println(url);

  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" +
               "User-Agent: BuildFailureDetectorESP8266\r\n" +
               "Connection: close\r\n\r\n");

  Serial.println("Request sent!");

  while (client.connected()) {
    String line = client.readStringUntil('\n');
    if (line == "\r") {
      Serial.println("Headers received!");
      break;
    }
  }

  String line = client.readStringUntil('\n');
  if (line.startsWith("{\"state\":\"success\"")) {
    Serial.println("Data sent successfully!");
  } else {
    Serial.println("Failed to send data!");
  }

  Serial.println("Closing connection.");
}

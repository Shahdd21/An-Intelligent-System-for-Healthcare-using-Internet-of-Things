# Main Idea
- Developed a system with vital and environmental sensors for real-time patient and environment monitoring.
- Implemented real-time data transmission to Google Sheets for seamless integration with the monitoring application.
- Designed an intuitive application for doctors and nurses to remotely monitor patients, providing up-to-date information.
- Enabled healthcare providers to view detailed patient profiles and room conditions.
- Key features included real-time alerts for abnormal readings and historical data analysis for tracking patient progress.
- Improved response times and quality of patient care through efficient remote monitoring.


## Description
The proposed system leverages the Internet of Things (IoT) to facilitate patient monitoring in Intensive Care Units (ICUs). Biological and environmental sensors send data in real-time to the application, enabling continuous monitoring. The system uses heart rate, temperature, humidity, and gas sensors. These sensors are connected to an ESP8266 board to collect their data and leverage its Wi-Fi capability to send the data over a wireless network to Google sheets,from that we store the data in Google cloud that more secure and it calculate the latency and the error of data transmission if there is an error ,from that, the application accesses the data. Based on Flutter, the application includes sign-up and login pages for doctors. There is also a rooms page where doctors can select a room and then choose to display a patient's data. The plan for future work includes providing insights based on patients' history for better assessment and implementing push notifications in case of emergencies. In addition to increasing the number of sensors to provide a more comprehensive diagnosis.


## Technologies
Internet of Things, Embedded Systems, ESP8266, Google Sheets API, Google Cloud Platform, C++, Flutter, Dart

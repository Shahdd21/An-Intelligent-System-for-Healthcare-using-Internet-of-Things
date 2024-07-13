import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import 'Login/Views/login.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "last-427305",
  "private_key_id": "707648c048268f63f4a2c77e70c0a15037d05fc7",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC2JHTYieEBUiXb\nQlT9SxSHhKjixl+yIs04MfiBvZlf7sIRFp3uTaTUMPYaSdz/MPfv2S+MTWmr+6Cg\nWxL3ArL8oUM5QZrW95/TUGq6mlSJQXClYtQs6bkd+z+xiPCSZm5u44A0r0F/s2x0\nWcjzSxFMwR6DzBOJdDX4Xj6UqzzgL+raUonP680PgXtrwWRvsjwhNNIMiYGNzEws\nDWvwLfpDmZqm2smzemo75uE78VEI1e/fKXOs2qc88Ll0OW0r2AOw/GuQr8qtc1r7\niEGIEWdee3JWc2q/3rdzt4UXcO7wklOMcQKOfPugESzKBGA9uaBwudBTS9ncQgYt\nUnCkpdPzAgMBAAECggEAGOeZNnZ71pNl67oBJvUaJIGGGiPnt9K8Xr+ubAcBrrVV\nwcJm68ugCwd6zxNkbVxDun7m2ndHSKXKS8LIMBAlaxedunl284e+ScWIImWxw2a4\nQVTnEBERJ8FP7zV7N3lcBjuDLzD7cruUy7/vEx0ji2wogPrpfPTv4Dr6sZdMZpbK\n+5BVMMnX9FnjuAlFJkKy8tE1BWG8YJ5/cEdyjL2aRdwqOZd04gmvOYT0xYKPhQhY\nxnBcezhzOTXM2bb7yDK7IyUhsqxdhKGV8Ows9p7S5gPFc1qPQyVgfYJfXNFwGFt4\nqdi/ie+41DTvDeOgfp83UgkBP9fE+4WeGhA6IVxEeQKBgQD7FHMvuBBTeCDB827T\ng34WvO7DFj4dnIs8jIZngFfRbFEMOZ78iCIZ1DYMrYT3lkg/ZUWx+o7LQ3LC1S3g\nmtRTU7vqsDjl2qjdj5lPc7f60nMU5rR4TQdf8ZiGj6fCnVx1eYCKCpmXUtqyYVF4\ngCrEsmzL+HON+O4YKAWePkxlJwKBgQC5ti3zPnsJMsPTYi61KR2SONEiHVNeKVZQ\nbBubCxJwKaIWN+8ySWk/X19JyX4s1eOZfB01qrpKmbsKYDMhZtyRxW7CiD5wAgo1\nlidmVFkm7knNMR+/SpH9EIJUZq5STE8tp/CEUqhgY8nasGK7Vps65aFJAjnGuR2L\n7S3ZLqiSVQKBgDUhQq6aWHoRNX1VMeJ4NLpDCJMnpcVGVwBdDCPiuLKMJSpdFxOB\nCxZEHZvZLAXoOymPGIxs5MKGZ0ZrLeYVXVC0q1MiLygUeR9JP7vcVNYyqj+GAjJi\numjHCuuOgoVgHyyMpXKQg6fN1JFinobNOD+fMf6HeIxWXKun7Ghr7maJAoGBALMi\nd9BaRHPq89nCqys0LcIN7Czr/K6nUQriPP6g/3gRsLed3Ky1A0CNzmxuX7b/2jsC\n7WoG9QtgnnqzsJ5XigtSVjRvF0sTrKVj4T1jv1s+HxI+gFEUrR1d/1lKcnwP/5Aa\nnnYFBUV0/BBmc9YhBDsbpSe3beOyTD3c2ozT5ObBAoGBAJNFC7TylnF5wQD+G9G6\nvmGEpOwFtuVH52hjFEMzwDT0PizsWkwcq+Xg0m8hGdyXLEMW6fBJ8cwoFequviFU\np6srCO6yvvXf+Nax+2rQ0KxlI+pmN4oDusIrKyt7Ys/pUHKYTuTFufY/q5d8HdAk\norAP85HHL38oO8YtMO43LPUv\n-----END PRIVATE KEY-----\n",
  "client_email": "last-216@last-427305.iam.gserviceaccount.com",
  "client_id": "106272590282654506204",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/last-216%40last-427305.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
const _spreadsheetId = '1f8b3t_plv0M4ZUFVAO-roAsP8QIb3FYES3A4vMeAik8';

void main() async {
  final gsheet = GSheets(_credentials);
  final ss = await gsheet.spreadsheet(_spreadsheetId);
  runApp(MyApp(ss: ss));
}

class MyApp extends StatelessWidget {
  final Spreadsheet ss;
  const MyApp({super.key, required this.ss});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(ss: ss),
    );
  }
}

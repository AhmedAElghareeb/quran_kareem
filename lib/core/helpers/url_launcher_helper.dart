import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherHelper {
  static Future<void> _launch(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> openUrl({required String url}) async {
    final Uri uri = Uri.parse(url);
    await _launch(uri.toString());
  }

  static Future<void> openMap(
      {required double latitude, required double longitude}) async {
    final Uri uri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    await _launch(uri.toString());
  }

  static Future<void> openEmail({required String email}) async {
    final Uri uri = Uri.parse('mailto:$email');
    await _launch(uri.toString());
  }

  static Future<void> openPhone({required String phone}) async {
    final Uri uri = Uri.parse('tel:$phone');
    await _launch(uri.toString());
  }
}

///Schemes for android.
// <queries>
// <!-- If your app opens https URLs -->
// <intent>
// <action android:name="android.intent.action.VIEW" />
// <data android:scheme="http" />
// </intent>
// <intent>
// <action android:name="android.intent.action.VIEW" />
// <data android:scheme="https" />
// </intent>
// <!-- If your app makes calls -->
// <intent>
// <action android:name="android.intent.action.DIAL" />
// <data android:scheme="tel" />
// </intent>
// <!-- If your sends SMS messages -->
// <intent>
// <action android:name="android.intent.action.SENDTO" />
// <data android:scheme="sms" />
// </intent>
// <!-- If your app sends emails -->
// <intent>
// <action android:name="android.intent.action.SEND" />
// <data android:mimeType="*/*" />
// </intent>
// <!-- If your app open different apps -->
// <intent>
// <action android:name="android.intent.action.VIEW" />
// <data android:scheme="tg" />
// </intent>
// </queries>

///Schemes for ios.
// <key>LSApplicationQueriesSchemes</key>
// <array>
// <string>https</string>
// <string>tel</string>
// <string>sms</string>
// <string>whatsapp</string>
// <string>viber</string>
// <string>tg</string>
// <string>itms-beta</string>
// <string>itms</string>
// <string>*/*</string>
// </array>

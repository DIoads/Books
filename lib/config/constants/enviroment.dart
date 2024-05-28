import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String bookKey = dotenv.env['BOOK_API_KEY'] ?? 'No api key';

  static String firebaseMessageSenderId =
      dotenv.env['FIREBASE_MESSENGER_SENDER_ID'] ?? 'No message sender ID';

  static String firebaseProjectId =
      dotenv.env['FIREBASE_PROJECT_ID'] ?? 'No project ID';

  static String firebaseStorageBucket =
      dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? 'No storage bucket';

  static String firebaseAuthDomain =
      dotenv.env['FIREBASE_AUTH_DOMAIN'] ?? 'No auth domain';

  static String firebaseDBUrl =
      dotenv.env['FIREBASE_DATABASE_URL'] ?? 'No Data Base URL';

  static String firebaseandroidClientId =
      dotenv.env['FIREBASE_androidClientId'] ?? 'No client ID';
  static String firebaseiosClientId =
      dotenv.env['FIREBASE_iosClientId'] ?? 'No client ID';
  static String firebaseiosBundleId =
      dotenv.env['FIREBASE_iosBundleId'] ?? 'No bundle ID';

  static String firebaseWebKey =
      dotenv.env['FIREBASE_API_KEY_web'] ?? 'No api key';
  static String firebaseAndroidKey =
      dotenv.env['FIREBASE_API_KEY_android'] ?? 'No api key';
  static String firebaseAppleKey =
      dotenv.env['FIREBASE_API_KEY_apple'] ?? 'No api key';
  static String firebaseWindowsKey =
      dotenv.env['FIREBASE_API_KEY_windows'] ?? 'No api key';

  static String firebaseAppIdWeb =
      dotenv.env['FIREBASE_APP_ID_web'] ?? 'No app ID';
  static String firebaseAppIdAndroid =
      dotenv.env['FIREBASE_APP_ID_android'] ?? 'No app ID';
  static String firebaseAppIdApple =
      dotenv.env['FIREBASE_APP_ID_apple'] ?? 'No app ID';
  static String firebaseAppIdWindows =
      dotenv.env['FIREBASE_APP_ID_windows'] ?? 'No app ID';
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String bookKey = dotenv.env['API_KEY'] ?? 'No hay api key';
}

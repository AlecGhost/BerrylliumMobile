import 'package:flutter_dotenv/flutter_dotenv.dart';

Future loadEnv() async {
  await dotenv.load(fileName: 'assets/.env');
}
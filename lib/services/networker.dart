import 'package:http/http.dart' as http;

abstract class Networker {

  static Future getData({required String url, required String path, Map<String, dynamic>? queryParameters}) async {
    http.Response response = await http.get(Uri.http(url, path, queryParameters));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Statuscode: ' +
          response.statusCode.toString() +
          '\nBody: ' +
          response.body);
    }
  }

  static Future<void> deleteData({required String url, required String path, Map<String, dynamic>? queryParameters}) async {
    http.Response response = await http.delete(Uri.http(url, path, queryParameters));
    if (response.statusCode != 200) {
      print('Statuscode: ' +
          response.statusCode.toString() +
          '\nBody: ' +
          response.body);
    }
  }
}

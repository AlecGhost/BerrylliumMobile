import 'dart:convert';
import 'package:berryllium_mobile/utilities/message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'load_env.dart';
import 'networker.dart';

abstract class BerrylliumAPI {
  static Future<String> _generateUrl() async {
    await loadEnv();
    return '${dotenv.env['IP_ADDRESS']}:5000';
  }

  static Future<Map<String, String>> _generateParams() async {
    await loadEnv();
    return {
      'username': 'BerrylliumMobile',
      'api-key': dotenv.env['BERRYLLIUM_API_KEY'].toString()
    };
  }

  static Future<List> getMessages() async {
    await loadEnv();
    String url = await _generateUrl();
    String path = '/messages';
    Map<String, String> params = await _generateParams();
    var data = await Networker.getData(
      url: url,
      path: path,
      queryParameters: params,
    );
    var messagesRaw = jsonDecode(data)['messages'];
    var messages = messagesRaw.map((e) => Message.fromJson(e)).toList();
    return messages;
  }

  static Future<void> deleteMessage(int id) async {
    await loadEnv();
    String url = await _generateUrl();
    String path = '/messages';
    Map<String, String> params = await _generateParams();
    await Networker.deleteData(
        url: url, path: '$path/$id/delete', queryParameters: params);
  }
}

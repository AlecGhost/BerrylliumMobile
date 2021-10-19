import 'package:berryllium_mobile/services/berryllium_api.dart';
import 'package:flutter/material.dart';

class MessageNotifier extends ChangeNotifier {
  List messages = [];

  MessageNotifier();

  Future updateMessages() async {
    messages = await BerrylliumAPI.getMessages();
    notifyListeners();
  }

  void deleteMessage(int id) async {
    BerrylliumAPI.deleteMessage(id);
  }
}
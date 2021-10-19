import 'package:berryllium_mobile/widgets/message_tile.dart';
import 'package:berryllium_mobile/utilities/message.dart';
import 'package:flutter/material.dart';

class MessageFullScreen extends StatelessWidget {
  final Message message;

  MessageFullScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message.subject),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: MessageTile(
                message: message,
                extended: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:berryllium_mobile/screens/message_full_screen.dart';
import 'package:berryllium_mobile/services/message_notifier.dart';
import 'package:berryllium_mobile/utilities/message.dart';
import 'package:berryllium_mobile/widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageTileWrapper extends StatefulWidget {
  final Message message;

  MessageTileWrapper(this.message);

  @override
  _MessageTileWrapperState createState() => _MessageTileWrapperState();
}

class _MessageTileWrapperState extends State<MessageTileWrapper> {
  bool extended = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // TODO: Animation for height change
          extended = !extended;
        });
      },
      onDoubleTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MessageFullScreen(widget.message),
        ),
      ),
      onLongPress: () => Provider.of<MessageNotifier>(context, listen: false).deleteMessage(widget.message.id),
      child: MessageTile(
        message: widget.message,
        extended: extended,
      ),
    );
  }
}

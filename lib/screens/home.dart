import 'package:berryllium_mobile/services/message_notifier.dart';
import 'package:berryllium_mobile/widgets/message_tile_wrapper.dart';
import 'package:berryllium_mobile/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  Future<void> _pullRefresh(BuildContext context) async {
    await Provider.of<MessageNotifier>(context, listen: false).updateMessages();
  }

  @override
  Widget build(BuildContext context) {
    List messages = Provider.of<MessageNotifier>(context).messages;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BerrylliumMobile',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RefreshIndicator(
              color: Constants.accentColor,
              onRefresh: () => _pullRefresh(context),
              child:
              ListView.builder(
                      padding: EdgeInsets.all(5),
                      itemBuilder: (context, index) {
                        return MessageTileWrapper(messages[index]);
                      },
                      itemCount: messages.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

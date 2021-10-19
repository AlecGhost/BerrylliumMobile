import 'package:flutter/material.dart';
import 'package:berryllium_mobile/utilities/constants.dart';
import 'package:berryllium_mobile/utilities/message.dart';

class MessageTile extends StatelessWidget {
  final Message message;
  final bool extended;

  MessageTile({required this.message, required this.extended});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(7),
                  child: Text(
                    message.sender,
                    style: Constants.messageTileTextStyleHeader,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(7),
                  child: Text(
                    message.timestamp,
                    style: Constants.messageTileTextStyleHeader,
                  ),
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
            height: 5,
            // color: Colors.black,
          ),
          Container(
            margin: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
            child: Text(
              'Subject: ${message.subject}',
              style: Constants.messageTileTextStyleSubject,
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
            height: extended ? null : height / 10,
            child: Text(
              message.toString(),
              style: Constants.messageTileTextStyleBody,
            ),
          ),
        ],
      ),
    );
  }
}

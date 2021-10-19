import 'package:berryllium_mobile/services/berryllium_api.dart';
import 'package:berryllium_mobile/services/message_notifier.dart';
import 'package:berryllium_mobile/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void loadData() async {
    await Provider.of<MessageNotifier>(context, listen: false).updateMessages();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => Home()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Constants.accentColor,
        ),
      ),
    );
  }
}
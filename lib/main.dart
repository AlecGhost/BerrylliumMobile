import 'package:berryllium_mobile/screens/home.dart';
import 'package:berryllium_mobile/screens/loading_screen.dart';
import 'package:berryllium_mobile/services/message_notifier.dart';
import 'package:berryllium_mobile/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageNotifier(),
      child: MaterialApp(
        title: 'BerrylliumMobile',
        theme: ThemeData.dark().copyWith(
          dividerColor: Constants.accentColor,
        ),
        home: LoadingScreen(),
      ),
    );
  }
}

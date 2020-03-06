import 'package:flutter/material.dart';
import 'package:ya/components/ya-tabs.dart';
import 'package:ya/events/event-details-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YA Vanguards App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: TabsMain(),
      routes: {
        '/event-details': (context) => EventDetailsPage()
      },
    );
  }
}

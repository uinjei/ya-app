import 'package:flutter/material.dart';
import 'package:ya/components/tabs.dart';
import 'package:ya/events/event-details-page.dart';

import 'package:firebase/firebase.dart';

//import 'dart:developer' as developer;

void main() {
  initFirestore();
  runApp(MyApp());
}

void initFirestore() {
  if (apps.isEmpty) {
    initializeApp(
      apiKey: "AIzaSyCurvWxamqv69XmNthp3gOeHLEOf9nYGcs",
      authDomain: "ya-app-4ce01.firebaseapp.com",
      databaseURL: "https://ya-app-4ce01.firebaseio.com",
      projectId: "ya-app-4ce01",
      storageBucket: "ya-app-4ce01.appspot.com"
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YA Vanguards App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: TabsPage(),
      routes: {'/event-details': (context) => EventDetailsPage()},
    );
  }
}

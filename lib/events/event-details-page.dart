
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventDetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final EventDetailsArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.title),),
      body: Column(
        children: <Widget>[
          Text(args.details),
          Text(args.date!=null?args.date:'null?')
        ],
      ),
    );
  }
}

class EventDetailsArgs {
  EventDetailsArgs(this.title, this.details, this.date);

  final String title;
  final String details;
  final String date;
}
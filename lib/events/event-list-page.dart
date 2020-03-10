import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ya/components/list.dart';
import 'package:ya/components/loading.dart';
import 'package:ya/data/event.dart';
import 'package:ya/events/event-details-page.dart';

//import 'dart:developer' as developer;

import 'package:ya/services/event-service.dart';

class EventListPage extends StatefulWidget {
  EventListPage({Key key, @required this.title}) : super(key: key);

  static const String routeName = "/event-list";
  final String title;

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  var eventList = new List<ListTileArgs>();
  var isLoading = true;

  void _getEventList() {

    EventService.getEventList().then((value) {
       setState(() {
        isLoading = false;
        eventList = _getEventListTileArgs(value);
      });
    });

  }

  initState() {
    super.initState();
    _getEventList();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading? WLoading() :
    WListView(
      listViewArgs: ListViewArgs(eventList),
      handleTap:  (args) => _handleTap(context, args),
    );
  }
}

 _handleTap(context, EventListTileArgs args) {
  Navigator.pushNamed(                                        
      context,                                                  
      '/event-details',                         
      arguments: EventDetailsArgs(                               
           args.title,
           args.details,
           args.date
      ),                                                                                                                 
    );
}

List<EventListTileArgs> _getEventListTileArgs(json) {
  return getEventList(json).map((e) => EventListTileArgs(
    title: e.title,
    details: e.details,
    date: DateFormat.yMMMd("en_US").format(e.date)
  )).toList();
}
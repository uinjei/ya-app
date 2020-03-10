import 'package:firebase/firestore.dart';
import 'package:ya/components/list.dart';

class Event {
  Event(this.title, this.details, this.date);

  final String title;
  final String details;
  final DateTime date;

  factory Event.fromJson(DocumentSnapshot doc) => _$EventFromJson(doc);
}

Event _$EventFromJson(DocumentSnapshot doc) {
  return Event(
    doc.get('title') as String,
    doc.get('description') as String,
    doc.get('date') as DateTime,
  );
}

List<Event> getEventList(List<DocumentSnapshot> docs) {
  var list = docs;
  return list.map((e) => Event.fromJson(e)).toList();
}

class EventListTileArgs extends ListTileArgs {
  EventListTileArgs({this.title, this.details, this.date}) :
    super(title: title, details: details);

  final String title;
  final String details;
  final String date;
}
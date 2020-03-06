import 'package:json_annotation/json_annotation.dart';
import 'package:ya/components/ya-list.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  Event(this.title, this.details, this.date);

  final String title;
  final String details;
  final DateTime date;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

List<Event> getEventList(Map<String, dynamic> json) {
  var list = json['results'] as List;
  return list.map((e) => Event.fromJson(e)).toList();
}

class EventListTileArgs extends ListTileArgs {
  EventListTileArgs({this.title, this.details, this.date}) :
    super(title: title, details: details);

  final String title;
  final String details;
  final String date;
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class EventService {
  static Future<Map<String, dynamic>> getEventList() async {
    var url = "https://parseapi.back4app.com/classes/Event";
    var response = await http.get(url, headers: {
      'X-Parse-Application-Id': '4oJABEpkrgto9G0eC9tiknG0RncmXai2ai7JKQTP',
      'X-Parse-REST-API-Key': '0BWbFIQSfrlsGuji3hMi9HplSddCsv0EgGnNQZv4',
    });
    return jsonDecode(response.body);
  }
}

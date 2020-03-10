import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';

//import 'dart:developer' as developer;

Firestore store = firestore();
CollectionReference ref = store.collection('events');

class EventService {
  static Future<List<DocumentSnapshot>> getEventList() async {
    return ref.get().then((value) => value.docs.toList());
  }
}
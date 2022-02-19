import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseApi {
  static Future<String> addWatchlist(List<String> watchlist) async {
    final docTodo = FirebaseFirestore.instance.collection('watchCollection');

    await docTodo.doc('watcherman').set({'watchlist': watchlist});

    return docTodo.id;
  }
}

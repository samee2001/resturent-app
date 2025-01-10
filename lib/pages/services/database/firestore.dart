import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrderTODatabase(String recipt) async {
    await orders.add({
      'recipt': recipt,
      'date': DateTime.now(),
    });
  }
}

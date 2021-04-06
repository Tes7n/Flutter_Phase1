import 'package:cloud_firestore/cloud_firestore.dart';

class StoreServices{

  getTopPickedStore(){
  return FirebaseFirestore.instance.collection('vendors').where('TopPicked',isEqualTo: true).snapshots();
  }
}
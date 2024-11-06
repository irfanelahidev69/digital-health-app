import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreResponse {
  final bool success;
  final String message;
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? data;

  FireStoreResponse({required this.success, required this.message, this.data});
}
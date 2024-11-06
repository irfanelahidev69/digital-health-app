import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/firestore_response.dart';

class FireStoreHandler {
  static final FireStoreHandler _instance = FireStoreHandler._internal();
  late FirebaseFirestore _firestore;

  static const String USER = 'users';

  factory FireStoreHandler() {
    return _instance;
  }

  FireStoreHandler._internal() {
    _initializeFirebaseApp();
  }

  void _initializeFirebaseApp() async {
    _firestore = FirebaseFirestore.instance;
  }

  Future<FireStoreResponse> addDocument({required String collectionName, required Map<String, dynamic> data,required String message}) async {
    try {
      await _firestore.collection(collectionName).add(data);
      return FireStoreResponse(success: true, message: message);
    } catch (e) {
      return FireStoreResponse(success: false, message: e.toString());
    }
  }
}

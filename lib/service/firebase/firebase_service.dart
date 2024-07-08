import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {

   /// var for firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  /// this for collect user data
  Future<void> saveFormData(Map<String, dynamic> data) {
    return _firestore.collection('users').add(data);
  }
}


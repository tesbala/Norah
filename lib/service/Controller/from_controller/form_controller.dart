import 'package:flutter/material.dart';
import 'package:norah/service/firebase/firebase_service.dart';


class FormController {
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> submitForm({
    required String name,
    required String email,
    required String mobile,
    required String address,
    required BuildContext context,
  }) async {
    try {
      await _firebaseService.saveFormData({
        'name': name,
        'email': email,
        'mobile': mobile,
        'address': address,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data saved successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save data: $error')),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:norah/myapp.dart';



void main() async {
	////here i am use firebase for only android
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp();
	runApp(MyApp());
}


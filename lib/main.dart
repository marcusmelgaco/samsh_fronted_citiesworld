import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smash_frontend_citiesworld/screen/countries_screen.dart';
import 'firebase_options.dart';

final firestoreInstance = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var document = firestoreInstance
      .collection('country')
      .orderBy('id')
      .snapshots()
      .map((event) => event.docs);
  var documentsId = document.map((event) => event.map((e) => e.id));
  documentsId.listen((event) => print(event));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cities Around The World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const CountriesScreen()
    );
  }

}


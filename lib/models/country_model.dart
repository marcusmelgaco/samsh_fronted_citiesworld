import 'package:cloud_firestore/cloud_firestore.dart';

class Country {
  Country({required this.name, required this.cities});
  Country.fromDoc(DocumentSnapshot doc) {
    name = doc.id;
    cities = doc.get('cities');
  }

  late String name;
  late List<String> cities;
}

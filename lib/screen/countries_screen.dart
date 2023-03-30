import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/country_model.dart';
import 'cities_screen.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('country').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Country country = Country.fromDoc(snapshot.data!.docs[index]);
                  return ListTile(
                    title: Text(country.name),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CitiesScreen(country: country)));
                    },
                  );
                });
          } else {
            return Text("No data");
          }
        },
      ),
    );
  }
}

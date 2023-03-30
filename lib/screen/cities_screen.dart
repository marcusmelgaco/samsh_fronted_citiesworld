import 'package:flutter/material.dart';

import '../models/country_model.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({Key? key, required this.country}) : super(key: key);
  final Country country;

  @override
  Widget build(BuildContext context) {
    List cities = country.cities;
    cities.sort((a, b) => (a as String).compareTo(b));

    return Scaffold(
        appBar: AppBar(
          title: Text("Cities in ${country.name}"),
        ),
        body: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              String city = cities[index];
              return ListTile(
                title: Text(city),
              );
            }));
  }
}

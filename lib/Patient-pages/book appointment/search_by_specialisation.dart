import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../doc_profile.dart';
import 'Book_appointment_doc_profile.dart';

class search_spec extends StatelessWidget {
  const search_spec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search doctor by specialisation",
          // style: TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

class Doctor {

  String name;
  String phno;
  String Specialisation;
  Image prfl = Image.asset("assets/images/imgdefault.png");
  Doctor.constructor1(this.name, this.phno, this.Specialisation, this.prfl);
  Doctor.constructor2(this.name, this.phno, this.Specialisation);
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<Doctor> searchTerms = [
    Doctor.constructor2("Dr Shalini veda", "234567", "psychiatrist"),
    Doctor.constructor2("Dr Vedik gosh", "2345622", "General practitioner"),
    Doctor.constructor2("Dr Amedi shah", "98765434567", "Orthopedics"),
    Doctor.constructor2("Dr Noor Ahmed", "98765434567", "Neurologist"),
    Doctor.constructor2("Dr Rahul Dariya", "8765433456", "Dermatologist"),
    Doctor.constructor2("Dr Meghna Raj", "987445676", "Oncologist"),
    Doctor.constructor2(
        "Dr Paresh Kumar", "98765434567", "General Pracitioner"),
    Doctor.constructor2("Dr Jeet Singh", "87654567887", "Nephrologist")
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Doctor> matchQuery = [];
    for (var doc in searchTerms) {
      if (doc.Specialisation.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(doc);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const viewDocProfileBook()));
          },
          leading: result.prfl,
          title:
              Text(result.name, style: const TextStyle(color: Colors.black87)),
          subtitle: Text(result.Specialisation),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Doctor> matchQuery = [];
    for (var doc in searchTerms) {
      if (doc.Specialisation.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(doc);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const viewDocProfileBook()));
          },
          leading: result.prfl,
          title:
              Text(result.name, style: const TextStyle(color: Colors.black87)),
          subtitle: Text(result.Specialisation),
        );
      },
    );
  }
}
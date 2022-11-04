import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../doc_profile.dart';

class search_name extends StatelessWidget {
  const search_name({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search doctor by name",
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

// class Doctor {
//   String name;
//   String phno;
//   String Specialisation;
//   Doctor.constructor2(this.name, this.phno, this.Specialisation);
// }

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  // List<QueryDocumentSnapshot<Map<String, dynamic>>> matchQuery = [
  //   Doctor.constructor2("Dr Shalini veda", "234567", "psychiatrist"),
  //   Doctor.constructor2("Dr Vedik gosh", "2345622", "General practitioner"),
  //   Doctor.constructor2("Dr Amedi shah", "98765434567", "Orthopedics"),
  //   Doctor.constructor2("Dr Noor Ahmed", "98765434567", "Neurologist"),
  //   Doctor.constructor2("Dr Rahul Dariya", "8765433456", "Dermatologist"),
  //   Doctor.constructor2("Dr Meghna Raj", "987445676", "Oncologist"),
  //   Doctor.constructor2(
  //       "Dr Paresh Kumar", "98765434567", "General Pracitioner"),
  //   Doctor.constructor2("Dr Jeet Singh", "87654567887", "Nephrologist")
  // ];

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
  // CollectionReference users = FirebaseFirestore.instance.collection('Doc-list');
  //CollectionReference dts = FirebaseFirestore.instance.collection('Doctor');
  var db = FirebaseFirestore.instance;
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
  var matchQuery = new List.filled(4, null, growable: true);
  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    // List<String> matchQuery = [];

    db.collection("Doctor")
        .snapshots()
        .listen((event) {
          int i=1;
      //List<QueryDocumentSnapshot<Map<String, dynamic>>> matchQuery = [];
      for (var doc in event.docs) {

        if (doc['Name'].toLowerCase().contains(query.toLowerCase())) {
          matchQuery[i]=(doc['Name']);
          i=i+1;
        }
      // print("cities in CA: ${cities.join(", ")}");
    }});


    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
            title:
            Text(result, style: const TextStyle(color: Colors.black87)),
            //subtitle: Text(result['Specialisation']),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const viewDocProfile()));
          },
          //leading: result.prfl,

        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  // var matchQuery = new List.filled(100, null, growable: true);
  @override
  Widget buildSuggestions(BuildContext context) {


    db.collection("Doctor")
        .snapshots()
        .listen((event) {
      //List<QueryDocumentSnapshot<Map<String, dynamic>>> matchQuery = [];
      int i = 1;
      for (var doc in event.docs) {

        if (doc['Name'].toLowerCase().contains(query.toLowerCase())) {
          matchQuery[i]=(doc['Name']);
          i=i+1;
        }
        // print("cities in CA: ${cities.join(", ")}");
      }});
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const viewDocProfile()));
          },
          // leading: result.prfl,
          title:
          Text(result, style: const TextStyle(color: Colors.black87)),
          //subtitle: Text(result['Specialisation']),
        );
      },
    );
  }
}
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ooadproject/Patient-pages/book%20appointment/search_by_name.dart';
import 'package:ooadproject/Patient-pages/book%20appointment/search_by_specialisation.dart';


// ignore: camel_case_types
class search_doc extends StatefulWidget {
  const search_doc({Key? key}) : super(key: key);

  @override
  State<search_doc> createState() => _search_docState();
}

// ignore: camel_case_types
class _search_docState extends State<search_doc> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    var cardTextStyle = const TextStyle(
        fontFamily: 'AbrilFatface Regular', fontSize: 20, color: Colors.black);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Book Appointment"),
          // Theme.of(context).scaffoldBackgroundColor,
          elevation: 3,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Stack(children: <Widget>[
          // const SizedBox(
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                const Center(
                    child: Text('Search Doctor...',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                const SizedBox(
                  height: 45,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const search_name()));
                  },
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: Color.fromARGB(77, 156, 227, 247),
                      minimumSize: Size(500, 50),
                      side: const BorderSide(
                          color: Color.fromARGB(84, 33, 149, 243), width: 1)),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('By Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // height: 2,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 12, 12))),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const search_spec()));
                  },
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: Color.fromARGB(77, 156, 227, 247),
                      minimumSize: Size(500, 50),
                      side: const BorderSide(
                          color: Color.fromARGB(84, 33, 149, 243), width: 1)),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('By Specialisation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // height: 2,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 12, 12))),
                  ),
                ),
              ],
            ),
          ))
        ]));
  }
}

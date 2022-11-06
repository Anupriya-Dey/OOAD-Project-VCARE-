import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../Doctor-pages/edit_profile_doc.dart';


class DocProfile extends StatefulWidget {
  DocProfile({super.key, required this.doc});
  Doctor doc;
  @override
  State<DocProfile> createState() => _DocProfileState();
}

// ignore: camel_case_types
class _DocProfileState extends State<DocProfile> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Doctor');
    Doctor doc = widget.doc;
    Widget buildDivider() => Container(
      height: 24,
      child: VerticalDivider(),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Profile"),
          // Theme.of(context).scaffoldBackgroundColor,
          elevation: 3,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pop(
              context,
            ),
          ),
        ),
        body: Container(
            padding:
            const EdgeInsets.only(left: 16, top: 25, right: 16, bottom: 12),
            // child: Align(
            //   alignment: Alignment.topCenter,
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 35,
                  // ),
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              // blurRadius: ,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/imgdefault.png',))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  doc.name,
                  style: TextStyle(
                      height: 1,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  doc.Specialisation,
                  style: TextStyle(
                      height: 2,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(doc.phno),
                    buildDivider(),
                    Text(doc.email),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
                  OutlinedButton(
                    onPressed: null,
                    // onPressed: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => edit_profile_doc(doc: doc)));
                    // },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      backgroundColor: Color.fromARGB(77, 94, 98, 99),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Book Appointment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // height: 2,
                              fontSize: 17,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 12, 12, 12))),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // buildTextField("Educational Details"),
                ],
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 120.0),
                    child: Text('Educational Details',
                        style: TextStyle(
                            height: 2,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.left)),
                Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Text(
                      doc.educDet,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 2,
                          color: Colors.grey[800],
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              ],
            ),
            ])));
  }
}

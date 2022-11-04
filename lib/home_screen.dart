import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ooadproject/requests.dart';
import 'Patients.dart';
import 'doc_profile.dart';
import 'medical%20history/patient_history.dart';
import 'edit_profile_doc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    CollectionReference users = FirebaseFirestore.instance.collection('Doctor');

    var cardTextStyle = TextStyle(
        fontFamily: 'AbrilFatface Regular', fontSize: 20, color: Colors.black);
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: double.infinity,
        width: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       alignment: Alignment.topCenter,
        //       image: AssetImage('assets/images/imgbgrnd.jpg')),
        // ),
      ),
      SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
                height: 64,
                margin: const EdgeInsets.only(bottom: 100),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1616002411355-49593fd89721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGFzc3BvcnQlMjBwaG90b3xlbnwwfHwwfHw%3D&w=1000&q=80https://images.unsplash.com/photo-1616002411355-49593fd89721?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGFzc3BvcnQlMjBwaG90b3xlbnwwfHwwfHw%3D&w=1000&q=80'),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        child: FutureBuilder<DocumentSnapshot>(
                          future: users
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(data['Name'],
                                        style: TextStyle(
                                            fontFamily: 'AbrilFatface Regular',
                                            color: Colors.black87,
                                            fontSize: 20)),
                                    Text(data['Email'],
                                        style: TextStyle(
                                            fontFamily: 'AbrilFatface Regular',
                                            color: Colors.black54)),
                                  ]);
                            }

                            return Text("loading");
                          },
                        ),
                      ),
                    ])),
            Expanded(
                child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 2,
                    children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: InkWell(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const viewDocProfile()),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'assets/images/imgdoctor.png',
                                  // height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Expanded(
                              Text(
                                'Profile',
                                style: cardTextStyle,
                                textAlign: TextAlign.center,
                                // overflow: TextOverflow.ellipsis,
                              )
                              // )
                            ],
                          ),
                        )),
                    // child: Expanded(

                    // )
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 4,
                      // child: Expanded(
                      child: InkWell(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Patients()),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/imgpatients.jpg',
                                    // height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                // Expanded(
                                //     child: Padding(
                                //         padding:
                                //             EdgeInsets.fromLTRB(10, 10, 10, 10),
                                Text(
                                  'Patients',
                                  style: cardTextStyle,
                                  textAlign: TextAlign.center,
                                  // overflow: TextOverflow.ellipsis,
                                )
                                // ))
                              ],
                            ),
                          ))
                      // )
                      ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 4,
                      // child: Expanded(
                      child: InkWell(
                        // onTap: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => CalendarAppointment()),//IMPORT SCHEDULE.DART
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'assets/images/imgcalender.jpg',
                                  // height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Expanded(
                              // child: Padding(
                              //     padding:
                              //         EdgeInsets.fromLTRB(10, 10, 10, 10),
                              Text(
                                'Appointments',
                                style: cardTextStyle,
                                textAlign: TextAlign.center,
                                // overflow: TextOverflow.ellipsis,
                              )
                              // )
                              // )
                            ],
                          ),
                        ),
                      )
                      // )
                      ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 4,
                      // child: Expanded(
                      child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyRequests()),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'assets/images/imgrequests.png',
                                  // height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Requests',
                                style: cardTextStyle,
                                textAlign: TextAlign.center,
                                // overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      )
                      // )
                      ),
                ]))
          ],
        ),
      ))
    ]));
  }
}

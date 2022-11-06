import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ooadproject/Doctor-pages/Pat-list/patient_profile.dart';

import '/Patient-pages/medical folder/patient_history.dart';
import 'Pat-prof.dart';
import 'book appointment/search_dr_tab.dart';
import 'my_appointments.dart';

// import 'package:ooadproject/doctor/Patients.dart';

// import 'package:ooadproject/patient/edit_profile_patient.dart';
class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Patient');

    var cardTextStyle = TextStyle(
        fontFamily: 'AbrilFatface Regular', fontSize: 20, color: Colors.black);
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: double.infinity,
        width: double.infinity,
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
                        backgroundImage: AssetImage("assets/images/imgdefault.png"),
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
                                  builder: (context) => const search_doc()),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'assets/images/imgcalendar.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Book\nAppointment',
                                style: cardTextStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )),
                  ),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 4,
                      child: InkWell(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const patient_history1()),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/imgfolder.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Medical Folder',
                                  style: cardTextStyle,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ))
                      // )
                      ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: InkWell(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const already_booked()),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'assets/images/imglist.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'My appointment',
                                style: cardTextStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: InkWell(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      viewPatProf ()),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'assets/images/imgprofile.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Profile',
                                style: cardTextStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        )),
                  ),
                ]))
          ],
        ),
      ))
    ]));
  }
}

import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'medical%20history/patient_history.dart';
import 'patient_profile.dart';



class Patients extends StatefulWidget {
  const Patients({super.key});

// patients
  // final _patientlist = MyPatient[];
  @override
  State<Patients> createState() => _PatientsState();

}

class _PatientsState extends State<Patients> {
//   List<Mypatients> MyPatientList = [
//     Mypatients.constructor2("anjalli", "23456"), //0
//     Mypatients.constructor2("nomi", "234asdas"), //1
//     Mypatients.constructor2("tru", "2sdsd6") //2
//   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Patients"),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Patient').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');

            return ListView.builder(

              itemCount: (snapshot.data!.docs.length) * 2,
              itemBuilder: (context, i) {
                if (i.isOdd) return const Divider();

                final j = i ~/ 2;

                // if (index < MyPatientList.length) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const viewPatientProfile()));
                  },
                  //leading: snapshot.data.docs[j], //profile image
                  title: Text(
                    snapshot.data!.docs[j]['Name'],
                    style: TextStyle(color: Colors.black87),
                  ),
                  subtitle: Text(snapshot.data!.docs[j]['contact no'].toString()),
                );
                // }
              },
            );
          }
        ));
  }
}

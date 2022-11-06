import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ooadproject/main.dart';
import '../medFolderDoc/prescription (1).dart';

// ignore: camel_case_types
class patient_history extends StatefulWidget {
  patient_history({super.key, required this.patient});
  Patient patient;
  @override
  State<patient_history> createState() => _patient_historyState();
}

// ignore: camel_case_types
class _patient_historyState extends State<patient_history> {
  @override
  Widget build(BuildContext context) {
    Patient patient = widget.patient;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(text: "Prescription"),
              Tab(
                text: "Medical History",
              )
            ]),
            title: const Text('Medical Folder'),
          ),
          body: TabBarView(children: [
            prescription(patient: patient),
            Container(),
          ]),
        ));
  }
}


// ignore: camel_case_types
// class prescripton extends StatelessWidget {
//   const prescripton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     );
//   }
// }
// class medical_history extends StatelessWidget {
//   const medical_history({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("hello"),
//     );
//   }
// }
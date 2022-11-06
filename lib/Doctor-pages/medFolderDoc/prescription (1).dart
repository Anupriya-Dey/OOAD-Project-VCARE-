import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../medFolderDoc/write_prescription.dart';
import 'package:ooadproject/main.dart';

class prescription extends StatefulWidget {
  prescription({super.key, required this.patient});
  Patient patient;
  @override
  State<prescription> createState() => _prescriptionState();
}

class _prescriptionState extends State<prescription> {
  List<Text> pres = [Text("HI"), Text("hello")];

  @override
  Widget build(BuildContext context) {
    Patient patient = widget.patient;
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: (patient.presriptions.length) * 2,
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();
          final j = i ~/ 2;
          return Text(patient.presriptions[j]);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => write_prescription(patient: patient)),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}

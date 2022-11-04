import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class already_booked extends StatefulWidget {
  const already_booked({super.key});

  @override
  State<already_booked> createState() => _already_bookedState();
}

class Myappointments {
  String doc_name;
  String date;
  int accept;
  Myappointments.constructor1(this.doc_name, this.date, this.accept);
  void setStatus(int num) {
    accept = num;
  }

  void nextStatus() {
    accept++;
  }

  Text showStatus() {
    if (accept == 0) {
      return const Text(
        "Request sent",
        style: TextStyle(color: Color.fromARGB(255, 236, 118, 110)),
      );
    } else if (accept == 1) {
      return const Text("Accepted", style: TextStyle(color: Colors.green));
    } else {
      return const Text("Ended",
          style: TextStyle(color: Color.fromARGB(255, 98, 95, 95)));
    }
  }
}

class _already_bookedState extends State<already_booked> {
  List<Myappointments> MyappointmentList = [
    Myappointments.constructor1("Dr Bhumi Nahar", "26 February", 0), //0
    Myappointments.constructor1("Dr Priyansh Goel", "14 January", 1), //1
    Myappointments.constructor1("Dr Priyansh Goel", "1 January", 2) //2
  ];
  // MyappointmentList[1].setStatus(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Appointments"),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView.builder(
          itemCount: (MyappointmentList.length) * 2,
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();

            final j = i ~/ 2;

            // if (index < MyPatientList.length) {
            return ListTile(
              onTap: () {
                setState(() {
                  MyappointmentList[j].nextStatus();
                });

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const viewPatientProfile()));
              },

              // leading: MyappointmentList[j].,
              title: Text(
                MyappointmentList[j].date,
                style: TextStyle(color: Colors.black87),
              ),
              subtitle: Text(MyappointmentList[j].doc_name),
              trailing: MyappointmentList[j].showStatus(),
            );
            // }
          },
        ));
    ;
  }
}

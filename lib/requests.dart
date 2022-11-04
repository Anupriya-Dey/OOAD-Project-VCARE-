import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Patient {
  String name;
  String phno;
  Image prfl = Image.asset("assets/images/imgdefault.png");
  Patient.constructor1(this.name, this.phno, this.prfl);
  Patient.constructor2(this.name, this.phno);
}

class Doctor {
  String name;
  String phno;
  String Specialisation;
  Image prfl = Image.asset("assets/images/imgdefault.png");
  List<appointmentDetails> requestlist = <appointmentDetails>[];
  List<appointmentDetails> MyAppointments = <appointmentDetails>[];
  Doctor.constructor1(this.name, this.phno, this.Specialisation, this.prfl);
  Doctor.constructor2(this.name, this.phno, this.Specialisation);

  void addrequest(appointmentDetails req) {
    requestlist.add(req);
  }

  void declineRequest(appointmentDetails req) {
    requestlist.remove(req);
  }

  void acceptRequest(appointmentDetails req) {
    MyAppointments.add(req);
    requestlist.remove(req);
  }
}

class appointmentDetails {
  Patient patient;
  DateTime startTime;
  DateTime endTime;
  appointmentDetails.constructor(this.patient, this.startTime, this.endTime);
}

class MyRequests extends StatefulWidget {
  MyRequests({Key? key}) : super(key: key);
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  Doctor doc = Doctor.constructor2("Komal Gupta", "8765433456", "Pychiatrist");
  DateFormat dateDisplay = DateFormat("MMMM dd, yyyy");
  DateFormat timeDisplay = DateFormat("hh : mm  a");
  @override
  void initState() {
    // TODO: implement initState
    getAppointmentList(doc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Appointment Requests"),
        ),
        body: ListView.builder(
          itemCount: (doc.requestlist.length),
          itemBuilder: (BuildContext, i) {
            return Card(
              child: ListTile(
                title: Text(dateDisplay.format(doc.requestlist[i].startTime) +
                    "   " +
                    timeDisplay.format(doc.requestlist[i].startTime)),
                subtitle: Text(doc.requestlist[i].patient.name),
                trailing: Column(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            doc.acceptRequest(doc.requestlist[i]);
                          });
                        },
                        child: const Text('Accept'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // background
                          onPrimary: Colors.white, // foreground
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            doc.declineRequest(doc.requestlist[i]);
                          });
                        },
                        child: const Text('Decline'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
        ));
  }

  void getAppointmentList(Doctor doc) {
    Patient p1 = Patient.constructor2("Mehak Sharma", "9876543256");
    doc.addrequest(appointmentDetails.constructor(
        p1, DateTime(2022, 11, 8, 9, 0, 0), DateTime(2022, 11, 8, 10, 0, 0)));
    Patient p0 = (Patient.constructor2("Neha Gujar", "9876543467"));
    doc.addrequest(appointmentDetails.constructor(
        p0, DateTime(2022, 11, 8, 11, 0, 0), DateTime(2022, 11, 8, 12, 0, 0)));
    Patient p2 = Patient.constructor2("Manashree Kalode", "9567898954");
    doc.addrequest(appointmentDetails.constructor(
        p2, DateTime(2022, 11, 8, 17, 0, 0), DateTime(2022, 11, 8, 18, 0, 0)));
    Patient p3 = (Patient.constructor2("Nishita Sigh", "9565766356"));
    doc.addrequest(appointmentDetails.constructor(
        p3, DateTime(2022, 11, 9, 10, 0, 0), DateTime(2022, 11, 9, 11, 0, 0)));
    Patient p4 = (Patient.constructor2("Kashish Prakash", "9876545677"));
    doc.addrequest(appointmentDetails.constructor(
        p4, DateTime(2022, 11, 9, 14, 0, 0), DateTime(2022, 11, 9, 15, 0, 0)));
    Patient p5 = (Patient.constructor2("Akansha Swati", "9899765446"));
    doc.addrequest(appointmentDetails.constructor(p5,
        DateTime(2022, 11, 10, 10, 0, 0), DateTime(2022, 11, 10, 11, 0, 0)));
    Patient p6 = (Patient.constructor2("Aarya Aggarwal", "8897553256"));
    doc.addrequest(appointmentDetails.constructor(p6,
        DateTime(2022, 11, 10, 11, 0, 0), DateTime(2022, 11, 10, 12, 0, 0)));
    Patient p7 = (Patient.constructor2("Shinjan Chaturvedi", "7875443256"));
    doc.addrequest(appointmentDetails.constructor(
        p7, DateTime(2022, 11, 12, 9, 0, 0), DateTime(2022, 11, 12, 10, 0, 0)));
    Patient p8 = (Patient.constructor2("Shreya Shivkumar", "9777273356"));
    doc.addrequest(appointmentDetails.constructor(p8,
        DateTime(2022, 11, 11, 12, 0, 0), DateTime(2022, 11, 11, 13, 0, 0)));
    Patient p9 = (Patient.constructor2("Prerna Chandolia", "9876543256"));
    doc.addrequest(appointmentDetails.constructor(p9,
        DateTime(2022, 11, 11, 10, 0, 0), DateTime(2022, 11, 11, 11, 0, 0)));
  }
}

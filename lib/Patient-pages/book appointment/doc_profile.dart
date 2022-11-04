import 'package:flutter/material.dart';

import 'book_appointment.dart';
// import 'package:ooadproject/doctor/medical%20folder/patient_history.dart';

// ignore: camel_case_types
class viewDocProfile extends StatefulWidget {
  const viewDocProfile({Key? key}) : super(key: key);

  @override
  State<viewDocProfile> createState() => _viewDocProfileState();
}

// ignore: camel_case_types
class _viewDocProfileState extends State<viewDocProfile> {
  @override
  Widget build(BuildContext context) {
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
                            image: NetworkImage(
                                "https://www.kindpng.com/picc/m/451-4517876_default-profile-hd-png-download.png"))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Dr Komal Gupta',
                    style: TextStyle(
                        height: 1,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    'Psychiatrist',
                    style: TextStyle(
                        height: 2,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("9509389255"),
                      buildDivider(),
                      Text("kgupta2906@gmail.com"),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FlutterDatePickerExample()));
                    },
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
                        'First Text' +
                            '\n' +
                            'Second Text' +
                            '\n' +
                            'Third Text',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            height: 2,
                            color: Colors.grey[800],
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                ],
              )
            ])));
  }
  // Widget buildTextField(
  //     String labelText) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 35.0),
  //     child: TextField(
  //       decoration: InputDecoration(
  //           contentPadding: const EdgeInsets.only(bottom: 3),
  //           labelText: labelText,
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           labelStyle: const TextStyle(
  //             fontSize: 25,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black,
  //           )),
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';
import 'package:ooadproject/Patient-pages/medical%20folder/patient_history.dart';
// import 'package:ooadproject/doctor/medical%20folder/patient_history.dart';
import '../../main.dart';
import '../medFolderDoc/patient_history (1).dart';

class viewPatientProfile extends StatefulWidget {
  viewPatientProfile({Key? key, required this.patient}) : super(key: key);
  Patient patient;
  @override
  State<viewPatientProfile> createState() => _viewPatientProfileState();
}

// ignore: camel_case_types
class _viewPatientProfileState extends State<viewPatientProfile> {
  @override
  Widget build(BuildContext context) {
    Patient patient = widget.patient;
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
          child: Column(
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

              Text(
                patient.name,
                style: TextStyle(
                    height: 2,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(patient.phno),
                  buildDivider(),
                  Text(patient.email),
                ],
              ),

              const SizedBox(
                height: 100,
              ),

              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => patient_history(patient: patient,)));
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  backgroundColor: Color.fromARGB(77, 94, 98, 99),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Medical Folder',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // height: 2,
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 12, 12, 12))),
                ),
              ),
            ],
          ),
        ));
  }
}

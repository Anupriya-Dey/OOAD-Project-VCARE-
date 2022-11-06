import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Patient-pages/edit_patient.dart';
import 'Patient-pages/home_screen_patient.dart';
import 'Doctor-pages/edit_profile_doc.dart';
import 'firebase_options.dart';
import 'Doctor-pages/home_screen.dart';
import 'signup.dart';
import 'package:intl/intl.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  // const db = firebase.firestore();
  runApp(MyApp());
}



class Patient {
  String name;
  String phno;
  String email;
  List<String> presriptions = <String>[];
  Image prfl = Image.asset("assets/images/imgdefault.png");

  Patient.constructor1(this.name, this.phno, this.email, this.prfl);

  Patient.constructor2(this.name, this.phno, this.email);

  void addPrescription(String s) {
    presriptions.add(s);
  }
}

class Doctor {
  String name;
  String phno;
  String email;
  String educDet;
  String Specialisation;
  Image prfl = Image.asset("assets/images/imgdefault.png");
  List<appointmentDetails> requestlist = <appointmentDetails>[];
  List<appointmentDetails> MyAppointments = <appointmentDetails>[];
  Doctor.constructor1(this.name, this.phno, this.Specialisation, this.prfl,this.email,this.educDet);
  Doctor.constructor2(this.name, this.phno, this.Specialisation,this.email,this.educDet);

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



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _success = 1;
  String _userEmail = "";

  Doctor doc = Doctor.constructor2("Komal Gupta", "8765433456", "Pychiatrist","kgupta@gmail.com","MBBS, AIIMS Rishikesh");
  DateFormat dateDisplay = DateFormat("MMMM dd, yyyy");
  DateFormat timeDisplay = DateFormat("hh : mm  a");
  @override
  void initState() {
    // TODO: implement initState
    getAppointmentList(doc);
    super.initState();
  }

  Widget build(BuildContext context) {

    void goToProfile(String qr) {
      if(qr=="Doctor" || qr=="doctor"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => edit_profile_doc(doc: doc)),
      );}
      else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const edit_patient()),
        );
      }
    }

    void goToHomescreen(String qr) {
      if(qr=="Doctor" || qr=="doctor"){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(doc: doc)),
        );
      }
      else{
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen1()),
      );
      }
    }

    void _singIn(String u) async {
      final User? user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;

      if (user != null) {
        setState(() {
          _success = 2;
          _userEmail = user.email!;
        });
      } else {
        setState(() {
          _success = 3;
        });
      }
      if (_success == 2) {
        CollectionReference? users ;
        if(u=="Doctor" || u=="doctor"){
         users =
          FirebaseFirestore.instance.collection('Doctor');}
        else if(u=="Patient" || u=="patient"){
          users =
          FirebaseFirestore.instance.collection('Patient');
        }
        else{
          users = null;
        }

          if(users!=null){
            final docRef = users.doc(FirebaseAuth.instance.currentUser?.uid);
            docRef.get().then(
                  (DocumentSnapshot doc) {
                final data = doc.data() as Map<String, dynamic>;
                if (data['Name'] == "")
                  goToProfile(u);
                else
                  goToHomescreen(u);
              },
              onError: (e) => print("Error getting document: $e"),
            );
          }
          else print("Error");
        }
      }
  String po="";
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                child: Text("Welcome",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 35, left: 20, right: 30),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )),
                obscureText: true,
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (value) {
                  po = value;
                },
                decoration: InputDecoration(
                    labelText: 'Doctor/Patient',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    _success == 1
                        ? ''
                        : (_success == 2 ? '' : 'Sign in failed'),
                    style: TextStyle(color: Colors.red),
                  )),
              SizedBox(
                height: 40,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () async {
                    _singIn(po);
                  },
                  child: const Text("LOGIN",
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2.2,
                          color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // foreground
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text('Register',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }

  void getAppointmentList(Doctor doc) {
    Patient p1 =
    Patient.constructor2("Mehak Sharma", "9876543256", "msharma@gmail.com");
    doc.addrequest(appointmentDetails.constructor(
        p1, DateTime(2022, 11, 8, 9, 0, 0), DateTime(2022, 11, 8, 10, 0, 0)));
    Patient p0 =
    (Patient.constructor2("Neha Gujar", "9876543467", "ngujar@gmail.com"));
    doc.addrequest(appointmentDetails.constructor(
        p0, DateTime(2022, 11, 8, 11, 0, 0), DateTime(2022, 11, 8, 12, 0, 0)));
    Patient p2 = Patient.constructor2(
        "Manashree Kalode", "9567898954", "mKalode@gmail.com");
    doc.addrequest(appointmentDetails.constructor(
        p2, DateTime(2022, 11, 8, 17, 0, 0), DateTime(2022, 11, 8, 18, 0, 0)));
    Patient p3 = (Patient.constructor2(
        "Nishita Singh", "9845766356", "nSingh@gmail.com"));
    doc.addrequest(appointmentDetails.constructor(
        p3, DateTime(2022, 11, 9, 10, 0, 0), DateTime(2022, 11, 9, 11, 0, 0)));
    Patient p4 = (Patient.constructor2(
        "Kashish Prakash", "9876545677", "kPrakash@gmail.com"));
    doc.addrequest(appointmentDetails.constructor(
        p4, DateTime(2022, 11, 9, 14, 0, 0), DateTime(2022, 11, 9, 15, 0, 0)));
    Patient p5 = (Patient.constructor2(
        "Akansha Swati", "9899765446", "ASwati@gmail.com"));
    doc.addrequest(appointmentDetails.constructor(p5,
        DateTime(2022, 11, 10, 10, 0, 0), DateTime(2022, 11, 10, 11, 0, 0)));
    Patient p6 = (Patient.constructor2(
        "Aarya Aggarwal", "8897553256", "aAgarwal@gmail.com"));
    doc.addrequest(appointmentDetails.constructor(p6,
        DateTime(2022, 11, 10, 11, 0, 0), DateTime(2022, 11, 10, 12, 0, 0)));
    Patient p7 = (Patient.constructor2(
        "Shinjan Chaturvedi", "7875443256", "sChaturvedi@gmail.com"));
    doc.addrequest(appointmentDetails.constructor(
        p7, DateTime(2022, 11, 12, 9, 0, 0), DateTime(2022, 11, 12, 10, 0, 0)));
    Patient p8 = (Patient.constructor2(
        "Shreya Shivkumar", "9777273356", "sShivkumar@gmail.com"));
    doc.addrequest(appointmentDetails.constructor(p8,
        DateTime(2022, 11, 11, 12, 0, 0), DateTime(2022, 11, 11, 13, 0, 0)));
    Patient p9 = (Patient.constructor2(
        "Prerna Chandolia", "9876543256", "pChandolia@gmail.com"));
    doc.addrequest(appointmentDetails.constructor(p9,
        DateTime(2022, 11, 11, 10, 0, 0), DateTime(2022, 11, 11, 11, 0, 0)));
  }
}

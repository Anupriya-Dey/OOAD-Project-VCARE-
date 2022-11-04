import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Patient-pages/edit_patient.dart';
import 'Patient-pages/home_screen_patient.dart';
import 'edit_profile_doc.dart';
import 'firebase_options.dart';
import 'home_screen.dart';
import 'signup.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  // const db = firebase.firestore();
  runApp(MyApp());
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

  @override
  Widget build(BuildContext context) {
    void goToProfile(String qr) {
      if(qr=="Doctor" || qr=="doctor"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const edit_profile_doc()),
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
          MaterialPageRoute(builder: (context) => const HomeScreen()),
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
}

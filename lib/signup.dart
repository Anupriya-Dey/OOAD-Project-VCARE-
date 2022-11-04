import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit_profile_doc.dart';
import 'main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _sucess = false;
  late String _userEmail;

  @override
  Widget build(BuildContext context) {
    void goToLogin() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Login page',)),
      );
    }

    void _register() async {
      var user = _auth
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        FirebaseFirestore.instance
            .collection('Doctor')
            .doc(value.user?.uid)
            .set({"Email": value.user?.email,
            });
      });

      if (user != null) {
        setState(() {
          _sucess = true;
        });
      } else {
        setState(() {
          _sucess = false;
        });
      }
      if (_sucess) goToLogin();
    }

    return new Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                child: Text("SignUp",
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
              SizedBox(
                height: 40,
              ),
              Container(
                height: 40,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.greenAccent,
                  color: Colors.black,
                  elevation: 7,
                  child: GestureDetector(
                      onTap: () async {
                        _register();
                      },
                      child: Center(
                          child: Text('SIGNUP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')))),
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
                      Navigator.of(context).pop();
                    },
                    child: Text('Go Back',
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

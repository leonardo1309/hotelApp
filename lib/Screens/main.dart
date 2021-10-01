import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/AppConstants.dart';
import 'package:hotel_app/Screens/bookingPage.dart';
import 'package:hotel_app/Screens/conversationPage.dart';
import 'package:hotel_app/Screens/createPostingPage.dart';
import 'package:hotel_app/Screens/guestHomePage.dart';
import 'package:hotel_app/Screens/hostHomePage.dart';
import 'package:hotel_app/Screens/loginPage.dart';
import 'package:hotel_app/Screens/personalInfoPage.dart';
import 'package:hotel_app/Screens/viewPostingPage.dart';
import 'package:hotel_app/Screens/viewProfilePage.dart';

import 'signUpPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        GuestHomePage.routeName: (context) => GuestHomePage(),
        PersonalInfoPage.routeName: (context) => PersonalInfoPage (),
        //viewProfilePage.routeName: (context) => viewProfilePage (),
        BookingPage.routeName: (context) => BookingPage(),
        ConversationPage.routeName: (context) => ConversationPage(),
        HostHomePage.routeName: (context) => HostHomePage(),
        CreatePostingPage.routeName: (context) => CreatePostingPage(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _initialized = false;
  bool _error = false;

  void initializeFirebase() async {
    try{
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    }catch(e){
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFirebase();
    Timer(Duration(seconds: 2),() {
      Navigator.pushNamed(context, LoginPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.hotel, size: 80,),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('${AppConstants.appName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

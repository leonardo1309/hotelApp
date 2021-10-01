import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/AppConstants.dart';
import 'package:hotel_app/Views/textWidgets.dart';

import 'guestHomePage.dart';



class SignUpPage extends StatefulWidget {

  static final String routeName = '/SignUpPageRoute';

  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  void _signUp(){
    Navigator.pushNamed(context, GuestHomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: 'Sign Up')
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Please enter the following information:',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),

                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'First name'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),

                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Last name'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),

                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'City'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),

                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Country'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),

                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Bio'
                          ),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: MaterialButton(
                    onPressed: () {
                      _signUp();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    color: Colors.blue,
                    height: MediaQuery.of(context).size.height / 13,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/AppConstants.dart';
import 'package:hotel_app/Models/data.dart';
import 'package:hotel_app/Models/userObjects.dart';
import 'package:hotel_app/Screens/guestHomePage.dart';
import 'package:hotel_app/Screens/signUpPage.dart';



class LoginPage extends StatefulWidget {

  static final String routeName = '/LoginPageRoute';

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

 void _signUp() {
    Navigator.pushNamed(context, SignUpPage.routeName);
  }

 void _login() {
   if(_formKey.currentState.validate()){

     String email = _emailController.text;
     String password = _passwordController.text;
     User fireUser;
     FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password,
     ).then((fireUser){
       String userID = fireUser.user.uid;
       AppConstants.currentUser = Usser(id: userID);
       AppConstants.currentUser.getUserInfoFromFirestore().whenComplete(() => {
         AppConstants.currentUser.getImageFromStorage().whenComplete(() => {
       Navigator.pushNamed(context, GuestHomePage.routeName),
       }),
       });
     });
   }
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Welcome to ${AppConstants.appName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
              Form(
                key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),

                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email'
                          ),
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          validator: (text) {
                            if(!text.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          controller: _emailController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),

                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password'
                          ),
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          obscureText: true,
                          validator: (text) {
                            if(text.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          controller: _passwordController,
                        ),
                      ),
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: MaterialButton(
                  onPressed: () {
                    _login();
                  },
                  child: Text(
                    'Login',
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
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: MaterialButton(
                  onPressed: () {
                    _signUp();
                  },
                  child: Text(
                    'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                  color: Colors.grey,
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
    );
  }
}
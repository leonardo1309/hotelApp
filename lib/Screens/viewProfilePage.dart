import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/AppConstants.dart';
import 'package:hotel_app/Models/data.dart';
import 'package:hotel_app/Models/reviewObjects.dart';
import 'package:hotel_app/Models/userObjects.dart';
import 'package:hotel_app/Views/formWidgets.dart';
import 'package:hotel_app/Views/listWidgets.dart';
import 'package:hotel_app/Views/textWidgets.dart';

import 'guestHomePage.dart';

class viewProfilePage extends StatefulWidget {
  static final String routeName = '/viewProfilePageRoute';
  final Contact contact;

  viewProfilePage({this.contact, Key key}) : super(key: key);

  @override
  _viewProfilePageState createState() => _viewProfilePageState();
}

class _viewProfilePageState extends State<viewProfilePage> {

  Usser _user;

  @override
  void initState() {
    if(widget.contact.id == AppConstants.currentUser.id) {
      this._user = AppConstants.currentUser;
    } else {
      this._user = widget.contact.createUserFromContact();
      this._user.getUserInfoFromFirestore().whenComplete(() => {
        setState((){}),
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarText(text: 'View Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 4 / 7,
                    child: AutoSizeText(
                      'Hi my name is ${_user.firstName}!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: MediaQuery.of(context).size.width / 9.5,
                    child: CircleAvatar(
                      backgroundImage: _user.displayImage,
                      radius: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  'About me',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: AutoSizeText(
                  _user.bio,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.home),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: AutoSizeText(
                        'Vive en ${_user.city}, ${_user.country}',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ReviewForm(),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users/${_user.id}/reviews').orderBy('dateTime', descending: true).snapshots(),
                  builder: (context, snapshots) {
                    switch (snapshots.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return ListView.builder(
                          itemCount: snapshots.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context , index){
                            DocumentSnapshot snapshot = snapshots.data.documents[index];
                            Review currentReview = Review();
                            currentReview.getReviewInfoFromFirestore(snapshot);
                            return Padding(
                              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                              child: ReviewListTile(review: currentReview,),
                            );
                          },
                        );
              }
              }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

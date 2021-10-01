import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/AppConstants.dart';
import 'package:hotel_app/Screens/guestHomePage.dart';
import 'package:hotel_app/Screens/hostHomePage.dart';
import 'package:hotel_app/Screens/loginPage.dart';
import 'package:hotel_app/Screens/personalInfoPage.dart';
import 'package:hotel_app/Screens/viewProfilePage.dart';




class AccountPage extends StatefulWidget {

  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  String _hostingTitle = 'To Host Dashboard';

  void _logout(){
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  void _changeHosting() {
    if (AppConstants.currentUser.isCurrentlyHosting) {
      AppConstants.currentUser.isCurrentlyHosting = false;
      Navigator.pushNamed(context, GuestHomePage.routeName);
    } else {
      AppConstants.currentUser.isCurrentlyHosting = true;
      Navigator.pushNamed(context, HostHomePage.routeName);
    }
  }

  @override
  void initState() {
    if(AppConstants.currentUser.isCurrentlyHosting){
      _hostingTitle = 'To Guest Dashboard';
    }else{
      _hostingTitle = 'To Host Dashboard';
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => viewProfilePage (contact: AppConstants.currentUser.createContactFormUser(),),),);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: MediaQuery.of(context).size.width/9.5,
                    child: CircleAvatar(
                      backgroundImage: AppConstants.currentUser.displayImage,
                      radius: MediaQuery.of(context).size.width/10,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        AppConstants.currentUser.getFullName(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                      AutoSizeText(
                        AppConstants.currentUser.email,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              MaterialButton(
                height: MediaQuery.of(context).size.height / 15.0,
                onPressed: (){
                  Navigator.pushNamed(context, PersonalInfoPage.routeName);
                },
                child: AccountPageListTile(text: 'Personal information', iconData: Icons.person,),
              ),
              MaterialButton(
                height: MediaQuery.of(context).size.height / 15.0,
                onPressed: (){
                  _changeHosting();
                },
                child: AccountPageListTile(text: _hostingTitle, iconData: Icons.hotel,),
              ),
              MaterialButton(
                height: MediaQuery.of(context).size.height / 15.0,
                onPressed: _logout,
                child: AccountPageListTile(text: 'Logout', iconData: null,),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AccountPageListTile extends StatelessWidget {

  final String text;
  final IconData iconData;

  AccountPageListTile({Key key,this.text,this.iconData} ): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: Text(
        this.text,
        style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.normal
      ),
      ),
      trailing: Icon(
        this.iconData,
      size: 35.0,),
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/AppConstants.dart';
import 'package:hotel_app/Views/calendarWidgets.dart';
import 'package:hotel_app/Views/listWidgets.dart';

class MyBookingsPage extends StatefulWidget {
  MyBookingsPage({Key key}) : super(key: key);

  @override
  _MyBookingsPageState createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {

  List<DateTime> _bookedDates = [];

  @override
  void initState() {
    this._bookedDates = AppConstants.currentUser.getAllBookedDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 35),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Dom', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Lun', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Mar', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Mier', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Jue', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Vie', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Sab', style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.9,
              child: PageView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return CalendarMonthWidget(
                      monthIndex: index,
                      bookedDates: this._bookedDates,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,25, 0, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      'Filter by posting',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Reset',
                      style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 25),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: AppConstants.currentUser.myPostings.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: InkResponse(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: MyPostingListTile(posting: AppConstants.currentUser.myPostings[index],),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

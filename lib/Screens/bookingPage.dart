import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/AppConstants.dart';
import 'package:hotel_app/Models/postingObjects.dart';
import 'package:hotel_app/Views/calendarWidgets.dart';
import 'package:hotel_app/Views/textWidgets.dart';

import 'guestHomePage.dart';



class BookingPage extends StatefulWidget {

  static final String routeName = '/BookingPageRoute';
  final Posting posting;

  BookingPage({this.posting, Key key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  Posting _posting;
  List<CalendarMonthWidget> _calendarWidgets;
  List<DateTime> bookedDates;

  void _buildCalendarWidgets() {
    _calendarWidgets = [];
    for(int i = 0 ; i < 12 ; i ++) {
      _calendarWidgets.add(CalendarMonthWidget());
    }
  }

  @override
  void initState() {
    this._posting = widget.posting;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: AppBarText(text: 'Book ${this._posting.name}')
      ),
      body: Padding(padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Dom',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Lun',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Mar',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Mier',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Jue',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Vie',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Sab',style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.8,
              child: PageView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index){
                    return CalendarMonthWidget(monthIndex: index, bookedDates: _posting.getAllBookedDates(),);
                  }
              ),
            ),
          ),
          MaterialButton(
            onPressed: (){},
            child: Text('Book Now!'),
            minWidth: double.infinity,
            height: MediaQuery.of(context).size.height / 14,
            color: Colors.blue,
          )
        ],
      ),
    ),
    );
  }
}
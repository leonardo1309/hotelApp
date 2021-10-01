
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/userObjects.dart';

class AppConstants {
  static final String appName = 'Hotel App';
  static final String googleMapsAPIKey = 'AIzaSyALu1AZjxuhb8FMA6-hCO63sWHvpxmYOLk';


  static final Color selectedIconColor = Colors.deepOrange;
  static final Color nonSelectedIconColor = Colors.black;

  static Usser currentUser;

  static final Map<int, String> monthDict = {
    1: "Enero",
    2: "Febrero",
    3: "Marzo",
    4: "Abril",
    5: "Mayo",
    6: "Junio",
    7: "Julio",
    8: "Agosto",
    9: "Septiembre",
    10: "Octubre",
    11: "Noviembre",
    12: "Diciembre",
  };

  static final Map<int, int> daysInMonths = {
    1: 31,
    2: DateTime.now().year % 4 == 0 ? 29: 28,
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31,
  };
}
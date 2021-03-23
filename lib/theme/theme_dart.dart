import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    fontFamily: "Lato",
    primaryColor: Colors.green[400],
    appBarTheme: AppBarTheme(
      elevation: 0,
    ),
    backgroundColor: Colors.white, // Back ground
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)))),
    buttonColor: Color.fromARGB(255, 237, 237, 237), // Button search color
    hintColor: Color.fromARGB(255, 150, 150, 150), // search icon color
    accentColor: Colors.green[400], // Notification color
    focusColor: Color.fromARGB(255, 230, 231, 232), // Container color
    textTheme: TextTheme(
      button: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 150, 150, 150), // "Search" color
      ),
      headline1: TextStyle(
        fontSize: 34.0,
        letterSpacing: -1,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 23, 23, 23),
      ),
      headline2: TextStyle(
        fontSize: 27.0,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 23, 23, 23),
      ),
      headline3: TextStyle(
        fontSize: 27.0,
        fontWeight: FontWeight.w700,
        color: Color.fromARGB(255, 23, 23, 23),
      ),
      headline4: TextStyle(
        fontSize: 23.0,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 23, 23, 23),
      ),
      headline5: TextStyle(
        fontSize: 21.0,
        color: Colors.black, // Title products
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 19.0,
        color: Color.fromARGB(255, 170, 170, 170), // Title products
        fontWeight: FontWeight.w700,
      ),
      subtitle1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: Color.fromARGB(255, 4, 3, 15),
      ),
      subtitle2: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 4, 3, 15),
      ),
      bodyText1: TextStyle(
        height: 1.25,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(200, 120, 120, 120),
      ),
    ),
  );
}

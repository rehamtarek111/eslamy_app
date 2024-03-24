import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xff242424);
  static Color primaryLight = const Color(0xffB7935F);
  static Color whiteColor = const Color(0xffffffff);
  static Color primaryDark = const Color(0xff141A2E);
  static Color yellowColor = const Color(0xffFACC1D);

  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: blackColor,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      showUnselectedLabels: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
    ),
  );

  static ThemeData darkMode = ThemeData(
      primaryColor: primaryDark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: whiteColor,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        showUnselectedLabels: true,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: whiteColor),
        titleSmall: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: whiteColor),
      ));
}

import 'package:flutter/material.dart';

import 'common/constants/color_constants.dart';


ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.lightBlue,
    useMaterial3: false,
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: "Inter",
    appBarTheme: appBarTheme(),
    primaryColor: Colors.white,
    textTheme: textTheme(),
    unselectedWidgetColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(backgroundColor: Colors.white),
    popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(Colors.lightBlue),
    ),
    // inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600,),
    displayMedium:
        TextStyle(color: blueShade1, fontSize: 16, fontWeight: FontWeight.w200),
    displaySmall: TextStyle(
        color: Colors.black, fontSize: 32, fontWeight: FontWeight.w200),
    headlineMedium: TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
    headlineSmall: TextStyle(
        color: Color(0xff757575), fontSize: 12, fontWeight: FontWeight.w400),
    titleLarge: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
    bodyMedium: TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
    titleSmall: TextStyle(
        color: greyShade1, fontSize: 14, fontWeight: FontWeight.w400),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    // textTheme: TextTheme(),
  );
}

// InputDecorationTheme inputDecorationTheme() {
//   OutlineInputBorder outlineInputBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.zero,
//     // borderSide: BorderSide(color: Color(0xffC0C0C0), width: 1),
//     // gapPadding: 10,
//   );
//   return InputDecorationTheme(
//     floatingLabelBehavior: FloatingLabelBehavior.always,
//     contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
//     enabledBorder: outlineInputBorder,
//     focusedBorder: outlineInputBorder,
//     // border: outlineInputBorder,
//   );
// }

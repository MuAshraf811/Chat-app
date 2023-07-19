import 'package:chat/core/constants.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  //primaryColor: kAppColor,
  appBarTheme: AppBarTheme(
    color: kAppColor,
    centerTitle: true,
    
  ),
  scaffoldBackgroundColor: Colors.white,
  buttonTheme: ButtonThemeData(
    buttonColor: kAppColor,
  ),
);


ThemeData appDarkTheme = ThemeData.dark(
  //primaryColor: kAppColor,
  
);

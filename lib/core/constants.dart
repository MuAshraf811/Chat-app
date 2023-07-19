import 'package:chat/features/User_Home/view/chat.dart';
import 'package:chat/features/User_Home/view/groupsView.dart';
import 'package:chat/features/User_Home/view/profile.dart';
import 'package:chat/features/User_Home/view/settings.dart';

import 'package:flutter/widgets.dart';

String kLogIn = 'logInPage';
String kRegister = 'registerPage';
String kUserHomePage = 'userView';
Color kAppColor = const Color(0xff2596be);
List<Widget> kUserPages = const [
  Chat(),
  Groups(),
  Settings(),
  Profile(),
];
int kCurrentBottomNavigationIndex = 0;

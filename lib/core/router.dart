// ignore_for_file: prefer_const_constructors

import 'package:chat/core/constants.dart';
import 'package:chat/features/User_Home/view/userView.dart';
import 'package:chat/features/logIn/view/log_in.dart';
import 'package:chat/features/register/view/register.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> appRouter =
 {

  kLogIn :(p0) => LogIn(),
  kRegister :(p0) => RegisterView(),
  kUserHomePage :(p0) => UserView()

 };

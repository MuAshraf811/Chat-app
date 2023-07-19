import 'package:chat/core/Theme/bloc/theme_bloc.dart';
import 'package:chat/core/bloc/connection_bloc.dart';
import 'package:chat/core/blocObserver.dart';
import 'package:chat/core/constants.dart';
import 'package:chat/core/router.dart';
import 'package:chat/core/Theme/theme.dart';
import 'package:chat/features/logIn/logIn_Bloc/bloc/log_in_bloc_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/User_Home/bloc/cubit/navigation_in_bottom_bar_cubit.dart';
import 'features/register/register_Bloc/bloc/auth_bloc_bloc.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = const SimpleBlocObserver();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
        BlocProvider<ConnectionBloc>(
          create: (context) => ConnectionBloc(),
        ),
        BlocProvider<AuthBlocBloc>(
          create: (context) => AuthBlocBloc(),
        ),
        BlocProvider<LogInBlocBloc>(
          create: (context) => LogInBlocBloc(),
        ),
        BlocProvider<NavigationInBottomBarCubit>(
          create: (context) => NavigationInBottomBarCubit(),
        ),
         BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is DarkState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appDarkTheme,
              routes: appRouter,
              initialRoute: kLogIn,
            );
          } else if (state is LightState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              routes: appRouter,
              initialRoute: kLogIn,
            );
          }
           return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              routes: appRouter,
              initialRoute: kLogIn,
            );
        },
      ),
    );
  }
}

// ignore_for_file: unused_import

import 'package:chat/core/constants.dart';
import 'package:chat/core/widgets/customSpace.dart';
import 'package:chat/features/User_Home/view/widgets/bottomNavigation.dart';
import 'package:chat/features/User_Home/view/widgets/searchBarAndUpperPart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Theme/bloc/theme_bloc.dart';
import '../../../core/Theme/dataProvider.dart';
import '../../../core/bloc/connection_bloc.dart' as connection;
import '../bloc/cubit/navigation_in_bottom_bar_cubit.dart';
import 'chat.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
   @override
  void initState() {
    ThemeStorage.storingTheme();
    BlocProvider.of<ThemeBloc>(context).add(IntialFetchTheme());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: BlocListener<connection.ConnectionBloc, connection.ConnectionState>(
        listener: (context, state) {
          if (state is connection.WifiConnection) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Wifi connection Success'),
              backgroundColor: Colors.green,
            ));
          } else if (state is connection.DataConnection) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Mobile data connection Success'),
              backgroundColor: Colors.green,
            ));
          } else if (state is connection.NoConnection) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('No entrnet connection'),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: BlocBuilder<NavigationInBottomBarCubit, int>(
          builder: (context, state) {
            return kUserPages[
                BlocProvider.of<NavigationInBottomBarCubit>(context).state];
          },
        ),
      ),
    );
  }
}

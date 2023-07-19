// ignore_for_file: unused_import

import 'package:chat/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit/navigation_in_bottom_bar_cubit.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationInBottomBarCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex:
              BlocProvider.of<NavigationInBottomBarCubit>(context).state,
          onTap: (value) {
            BlocProvider.of<NavigationInBottomBarCubit>(context)
                .onIndexChange(value);
          },
          type: BottomNavigationBarType.fixed,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            ),
          ],
        );
      },
    );
  }
}

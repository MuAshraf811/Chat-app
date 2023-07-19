import 'package:chat/core/Theme/bloc/theme_bloc.dart';
import 'package:chat/core/constants.dart';
import 'package:chat/core/widgets/customSpace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: SwitchListTile(
                  value: BlocProvider.of<ThemeBloc>(context).check,
                  onChanged: (val) {
                    setState(() {
                      (val)
                          ? BlocProvider.of<ThemeBloc>(context)
                              .add(DarkThemeEvent())
                          : BlocProvider.of<ThemeBloc>(context)
                              .add(LightThemeEvent());
                    });
                  },
                  activeColor: kAppColor,
                  title: const Text('Dark mode'),
                ),
              ),
              const CustomSpace(height: 24, width: double.infinity),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Log Out'),
              ),
            ],
          ),
        );
      },
    );
  }
}

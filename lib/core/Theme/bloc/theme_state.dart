part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}
class DarkState extends ThemeState{}
class LightState extends ThemeState{}
class ErrorThemeState extends ThemeState{}
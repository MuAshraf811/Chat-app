part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}
class IntialFetchTheme extends ThemeEvent{}
class DarkThemeEvent extends ThemeEvent{}
class LightThemeEvent extends ThemeEvent{}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  late bool check;
  late SharedPreferences shared;
  ThemeBloc() : super(ThemeInitial()) {
    on<IntialFetchTheme>((event, emit) async {
      shared = await SharedPreferences.getInstance();

      if (shared.getString('theme') == 'Dark') {
        check = true;
        emit(DarkState());
      } else {
        check = false;
        emit(LightState());
      }
    });
    on<DarkThemeEvent>((event, emit) async {
      await SharedPreferences.getInstance();
      shared.setString('theme', 'dark');
      check = true;
      emit(DarkState());
    });
    on<LightThemeEvent>((event, emit) async {
      await SharedPreferences.getInstance();
      shared.setString('theme', 'light');
      check = false;
      emit(LightState());
    });
  }
}

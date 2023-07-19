// ignore_for_file: file_names
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
 static void storingTheme() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString('theme', 'light');
  }
}

import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDartTheme = false;
  String nameColorTheme = "";
  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }

  changeNameTheme() {
    if (isDartTheme) {
      nameColorTheme = "Dark Mode";
    } else {
      nameColorTheme = "Light Mode";
    }
    notifyListeners();
  }
}

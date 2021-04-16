import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
          primaryColor: Colors.blue[900],
          primaryColorLight: Color(0xfffff9c4),
          accentColor: Color(0xff536DFE),
          backgroundColor: Color(0xfafafa),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Color(0xff212121),
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(
              color: Color(0xff212121),
              fontWeight: FontWeight.w500,
            ),
            bodyText1: TextStyle(
              color: Color(0xff555555),
            ),
          ),
        );
      case ThemeType.Dark:
        return ThemeData(
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
          unselectedWidgetColor: Colors.white,
          primaryColor: Color(0xff222222),
          primaryColorLight: Color(0x333333),
          accentColor: Color(0xfffbc02d),
          backgroundColor: Color(0xff111111),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Color(0xffeeeeee),
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(
              color: Color(0xffdddddd),
              fontWeight: FontWeight.w500,
            ),
            bodyText1: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        );
      case ThemeType.Other:
        return ThemeData(
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
          primaryColor: Color(0xff845460),
          primaryColorLight: Color(0xfffff9c4),
          accentColor: Color(0xff536DFE),
          backgroundColor: Color(0xffead3cb),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: Color(0xff1b1f10),
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(
              color: Color(0xff1b1f10),
              fontWeight: FontWeight.w500,
            ),
            bodyText1: TextStyle(
              color: Color(0xff2b4f60),
            ),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}

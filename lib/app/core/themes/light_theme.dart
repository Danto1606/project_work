import 'package:project_work/index.dart';

class LightTheme {
  static final ThemeData data = ThemeData(
    primaryColor: ConstColors.primary,
    scaffoldBackgroundColor: ConstColors.background,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: ConstColors.primary,
      ),
      headlineMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: ConstColors.primary,
      ),
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: ConstColors.primary,
      ),
      labelLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: ConstColors.primary,
      ),
      labelMedium: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: ConstColors.primary,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ConstColors.primary,
      ),
      bodyLarge: TextStyle(fontSize: 20),
      bodyMedium: TextStyle(fontSize: 15),
      bodySmall: TextStyle(fontSize: 11),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: ConstColors.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ConstColors.background,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered),
    appBarTheme: const AppBarTheme(
      backgroundColor: ConstColors.background,
      iconTheme: IconThemeData(
        color: ConstColors.primary,
      ),
      titleTextStyle: TextStyle(color: ConstColors.primary),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      // suffixIconColor: ConstColors.primary,
      iconColor: ConstColors.primary,
      focusColor: ConstColors.primary,
      floatingLabelStyle: TextStyle(
        color: ConstColors.primary,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ConstColors.primary,
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ConstColors.primary,
      selectionColor: ConstColors.primary,
      selectionHandleColor: ConstColors.primary,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: ConstColors.primary,
      refreshBackgroundColor: ConstColors.background,
    ),
  );
}

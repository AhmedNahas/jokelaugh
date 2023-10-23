import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokelaugh/controllers/app_theme.dart';
import 'package:jokelaugh/controllers/theme_controller.dart';
import 'package:jokelaugh/screens/home_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ),
          (route) => false,
        );
        return true;
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SMS egy gate',
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: themeController.theme,
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/home': (context) => HomeScreen(),
        },
        home: HomeScreen(),
      ),
    );
  }
}

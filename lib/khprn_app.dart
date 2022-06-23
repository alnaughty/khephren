import 'package:flutter/material.dart';
import 'package:kprn/constant/app.dart';
import 'package:kprn/constant/palette.dart';
import 'package:kprn/views/splash_screen/splash_screen.dart';

class KhprnApp extends StatelessWidget {
  const KhprnApp({Key? key}) : super(key: key);
  static final AppConfig _config = AppConfig.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khephren',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(60),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(60),
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        primaryColor: Colors.grey.shade900,
        primarySwatch: Palette.kTint,
        fontFamily: "Inter",
        scaffoldBackgroundColor: const Color(0xff151925),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            height: 1,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: Color(0xff151925),
        ),
        backgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
      onGenerateRoute: _config.routes,
    );
  }
}

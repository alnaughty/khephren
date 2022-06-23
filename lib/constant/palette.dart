import 'package:flutter/material.dart';

class Palette {
  LinearGradient get buttonGradient => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [kToDark, kAccentToDark],
        tileMode: TileMode.mirror,
      );
  static final Color borderColor = Colors.grey.shade500.withOpacity(.5);
  Color get greyColor => Colors.grey.shade700.withOpacity(.4);
  MaterialColor get kNToDark => kToDark;
  MaterialColor get kNTint => kTint;
  MaterialColor get kNAccentToDark => kAccentToDark;
  static const MaterialColor kToDark = MaterialColor(
    0xffFFC739, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe5b333), //10%
      100: Color(0xffcc9f2d), //20%
      200: Color(0xffb28b27), //30%
      300: Color(0xff997722), //40%
      400: Color(0xff7f631c), //50%
      500: Color(0xff664f16), //60%
      600: Color(0xff4c3b11), //70%
      700: Color(0xff33270b), //80%
      800: Color(0xff191305), //90%
      900: Color(0xff000000), //100%
    },
  );
  static const MaterialColor kTint = MaterialColor(
    0xffFFC739, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffcc4c), //10%
      100: Color(0xffffd260), //20%
      200: Color(0xffffd774), //30%
      300: Color(0xffffdd88), //40%
      400: Color(0xffffe39c), //50%
      500: Color(0xffffe8af), //60%
      600: Color(0xffffeec3), //70%
      700: Color(0xfffff3d7), //80%
      800: Color(0xfffff9eb), //90%
      900: Color(0xfffff9eb), //100%
    },
  );

  static const MaterialColor kAccentToDark = MaterialColor(
    0xffFE7736,
    <int, Color>{
      50: Color(0xfffe844a),
      100: Color(0xffe46b30),
      200: Color(0xffcb5f2b),
      300: Color(0xffb15325),
      400: Color(0xff984720),
      500: Color(0xff7f3b1b),
      600: Color(0xff652f15),
      700: Color(0xff4c2310),
      800: Color(0xff190b05),
      900: Color(0xff000000),
    },
  );
}

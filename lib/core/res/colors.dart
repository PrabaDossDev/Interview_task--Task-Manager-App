import 'dart:ui';

import 'package:flutter/material.dart';

// Color Palette follows material guide
class AppColor {
  static const Color primary = Color(0xFF24A186);
  static Color primary60 = Color(0xFF24A186).withOpacity(0.6);

  static Color gradient = Color(0xFF06283A);
  static Color gradient1 = Color(0xFF134762);

  static const Color indicatorColor = Color(0xFFB8F5D4);
  static const Color primaryDark = Color(0xFF002539);
  static const Color secondary = Color(0xFF008FBE);
  static const Color accent = Color(0xFF000000);
  static const Color divider = Color(0x2B495A14);

  static const Color text = Color(0xFF515C6F);
  static const Color introText = Color(0xFF013b53);

  static const Color secondaryText = Color(0xFF666666);
  static const Color header = Color(0xFF002539);
  static const Color headerBlack = Color(0xFF202020);
  static const Color secondaryHeader = Color(0xFF2B495A);
  static const Color title = Color(0xFF2B495A);

  static const Color background = Color(0xFFFFFFFF);
  static const Color secondaryBackground = Color(0xFFF5F5F5);
  static const Color scaffoldBackground = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black85 = Color(0xD9000000);


  static const Color shadowColor = Color(0xFFE3E3E3);
  static Color chipShadowColor = Color(0xFF808080).withOpacity(0.5);

  static Color disabled = Color(0xFF808080);

  static const Color green = Color(0xFF0F8110);
  static const Color red = Color(0xFFCD3737);
  static const Color offerText = Color(0xFF24A186);
  static const Color orange = Color(0xFFf98d29);
  static const Color deepOrange = Color(0xFFE45C16);
  static const Color blue = Color(0xFF005f9b);

  static const Color dealsRed = Color(0xFFC30000);
  static const Color black20 = Color(0xFF344456);

  static const Color outline = Color(0xFFE0E0E0);
  static const Color outlineBorder = Color(0xFFC4C4C4);





  static Color opacityMetalColor(String metalName) {
    switch (metalName.toLowerCase()) {
      case "gold":
        return MaterialColor(
            0xFFF4BB40, {200: Color.fromRGBO(244, 187, 64, .3)}).shade200;
      case "silver":
        return MaterialColor(
            0xFF797979, {600: Color.fromRGBO(121, 121, 121, .7)}).shade600;
      case "platinum":
        return MaterialColor(
            0xFFEA616B, {700: Color.fromRGBO(234, 97, 107, .8)}).shade700;
      case "palladium":
        return MaterialColor(0xFF5F38B7, {600: Color.fromRGBO(95, 56, 183, .7)})
            .shade600;
      default:
        return MaterialColor(0xFF5F38B7, {200: Color.fromRGBO(95, 56, 183, .3)})
            .shade200;
    }
  }

}
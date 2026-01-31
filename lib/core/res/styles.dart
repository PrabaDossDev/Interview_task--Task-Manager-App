
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'fontsize.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {

  static const String fontFamily = "Manrope";

  static final ThemeData appTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColor.primary,
    primaryColorLight: AppColor.white,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primary,
      onPrimary: AppColor.text,
      secondary: AppColor.accent,
      onSecondary: AppColor.secondary,
      error: AppColor.red,
      onError: AppColor.white,
      background: AppColor.background,
      onBackground: AppColor.text,
      surface: AppColor.background,
      onSurface: AppColor.text,
    ),
    dividerColor: AppColor.divider,
    indicatorColor: AppColor.primaryDark,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColor.text,
      ),
      headlineSmall: TextStyle(color: AppColor.header),
      titleMedium: TextStyle(color: AppColor.secondaryHeader),
      labelLarge: TextStyle(color: AppColor.primary),
    ),
    iconTheme: IconThemeData(color: AppColor.black),
    primaryIconTheme:
    const IconThemeData.fallback().copyWith(color: AppColor.primary),
    appBarTheme: const AppBarTheme().copyWith(
      color: AppColor.scaffoldBackground,
      elevation: 1,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      iconTheme: const IconThemeData().copyWith(color: AppColor.primaryDark),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColor.secondaryBackground,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    fontFamily: "OpenSans",
    scaffoldBackgroundColor: AppColor.scaffoldBackground,
  );

  static final List<BoxShadow> cardShadow = [
    BoxShadow(color: AppColor.primary.withOpacity(0.08), spreadRadius:0, blurRadius:4),
  ];

  static const Widget customDivider = SizedBox(height: 0.6, child: Divider(color: AppColor.divider, thickness:1,),);


  static Decoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

}

class AppTextStyle {
  //
  static  TextStyle title1Medium = TextStyle(
      fontSize: AppFontSize.dp20.sp,letterSpacing: 0,
      fontWeight: FontWeight.w500,height: 1.30,
      color: AppColor.text
  );

  static  TextStyle title1SemiBold = TextStyle(
      fontSize: AppFontSize.dp20.sp,letterSpacing: 0,
      fontWeight: FontWeight.w600,height: 1.30,
      color: AppColor.text
  );
  static  TextStyle title1Bold = TextStyle(
      fontSize: AppFontSize.dp20.sp,letterSpacing: 0,
      fontWeight: FontWeight.w700,height: 1.30,
      color: AppColor.text
  );

  //
  static  TextStyle title2Medium = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.text
  );

  static  TextStyle title2SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w600,height: 1.50,
      color: AppColor.text
  );
  static  TextStyle title2Bold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,height: 1.50,
      color: AppColor.text
  );

//
  static  TextStyle title3Medium = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w500,height: 1.43,
      color: AppColor.text
  );

  static  TextStyle title3SemiBold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w600,height: 1.43,
      color: AppColor.text
  );
  static  TextStyle title3Bold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w700,height: 1.43,
      color: AppColor.text
  );

  //


  static  TextStyle label1Medium = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.text
  );
  static  TextStyle label1Regular = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,height: 1.50,
      color: AppColor.text
  );

  static  TextStyle label1SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w600,height: 1.50,
      color: AppColor.text
  );
  static  TextStyle label1Bold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,height: 1.50,
      color: AppColor.text
  );

  //
  static  TextStyle label2Medium = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w500,height: 1.43,
      color: AppColor.text
  );
  static  TextStyle label2Regular = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w400,height: 1.43,
      color: AppColor.text
  );

  static  TextStyle label2SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w600,height: 1.43,
      color: AppColor.text
  );
  static  TextStyle label2Bold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w700,height: 1.43,
      color: AppColor.text
  );
//
  static  TextStyle label3Medium = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w500,height: 1.33,
      color: AppColor.text
  );
  static  TextStyle label3Regular = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w400,height: 1.33,
      color: AppColor.text
  );

  static  TextStyle label3SemiBold = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w600,height: 1.33,
      color: AppColor.text
  );
  static  TextStyle label3Bold = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w700,height: 1.33,
      color: AppColor.text
  );

  //
  static  TextStyle label4SemiBold = TextStyle(
      fontSize: AppFontSize.dp10.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w600,height: 1.33,
      color: AppColor.text
  );
  static  TextStyle label4Bold = TextStyle(
      fontSize: AppFontSize.dp10.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w700,height: 1.33,
      color: AppColor.text
  );

  //
  static  TextStyle button1 = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.25,
      fontWeight: FontWeight.w500,height: 1.43,
      color: AppColor.text
  );
  static  TextStyle button2 = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.25,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.text
  );

  //
  static  TextStyle body1Medium = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 1.44,
      color: AppColor.text
  );
  static  TextStyle body1Regular = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,height: 1.44,
      color: AppColor.text
  );

  static  TextStyle body1SemiBold = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w600,height: 1.44,
      color: AppColor.text
  );
  static  TextStyle body1Bold = TextStyle(
      fontSize: AppFontSize.dp18.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,height: 1.44,
      color: AppColor.text
  );


  //
  static  TextStyle body2Medium = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.text
  );
  static  TextStyle body2Regular = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w400,height: 1.50,
      color: AppColor.text
  );

  static  TextStyle body2SemiBold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w600,height: 1.50,
      color: AppColor.text
  );
  static  TextStyle body2Bold = TextStyle(
      fontSize: AppFontSize.dp16.sp,letterSpacing: 0.15,
      fontWeight: FontWeight.w700,height: 1.50,
      color: AppColor.text
  );

  //
  static  TextStyle body3Medium = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w500,height: 1.43,
      color: AppColor.text
  );
  static  TextStyle body3Regular = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w400,height: 1.43,
      color: AppColor.text
  );

  static  TextStyle body3SemiBold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w600,height: 1.43,
      color: AppColor.text
  );
  static  TextStyle body3Bold = TextStyle(
      fontSize: AppFontSize.dp14.sp,letterSpacing: 0.10,
      fontWeight: FontWeight.w700,height: 1.43,
      color: AppColor.text
  );

  //
  static  TextStyle body4Medium = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w500,height: 1.50,
      color: AppColor.text
  );
  static  TextStyle body4Regular = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w400,height: 1.50,
      color: AppColor.text
  );

  static  TextStyle body4SemiBold = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w600,height: 1.50,
      color: AppColor.text
  );
  static  TextStyle body4Bold = TextStyle(
      fontSize: AppFontSize.dp12.sp,letterSpacing: 0.50,
      fontWeight: FontWeight.w700,height: 1.50,
      color: AppColor.text
  );


  static  TextStyle subtitle = TextStyle(
      fontSize: AppFontSize.dp16.sp,
      fontWeight: FontWeight.normal,
      color: AppColor.primaryDark,
      letterSpacing: 0.15,
      height: 1.5);

  static  TextStyle body = TextStyle(
      fontSize: AppFontSize.dp16,
      fontWeight: FontWeight.normal,
      color: AppColor.header,
      height: 1.5);


}
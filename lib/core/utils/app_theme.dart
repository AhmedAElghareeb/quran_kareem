import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/core/utils/app_styles.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    platform: TargetPlatform.iOS,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size(AppSpaces.infinitySide, 50.h),
        textStyle: AppStyles.titleStyle.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      titleTextStyle: AppStyles.titleStyle,
      backgroundColor: AppColors.primaryColor,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 20.sp,
      ),
      titleSpacing: 0,
      toolbarHeight: 70,
      centerTitle: false,
    ),
  );
}

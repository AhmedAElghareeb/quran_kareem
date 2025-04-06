import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static final TextStyle titleStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: Colors.black54,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle subTitleStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: Colors.black26,
    overflow: TextOverflow.ellipsis,
  );
}
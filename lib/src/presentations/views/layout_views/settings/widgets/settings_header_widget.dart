import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/image_widget.dart';

class SettingsHeaderWidget extends StatelessWidget {
  const SettingsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      assetImage: AppAssets.logo,
      height: 150.sp,
      width: 150.sp,
    );
  }
}

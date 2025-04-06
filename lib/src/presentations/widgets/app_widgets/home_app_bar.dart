import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/core/utils/app_styles.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/svg_image_widget.dart';

AppBar homeAppBar() {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    title: Text(
      'quranKareem'.tr(),
      style: AppStyles.titleStyle.copyWith(
        color: AppColors.whiteColor,
        fontSize: 22.sp,
      ),
    ),
    actions: [
      Padding(
        padding: AppSpaces.horizontalPadding3,
        child: SvgImageWidget(
          image: AppAssets.quran,
          color: AppColors.whiteColor,
          side: 30.sp,
        ),
      ),
    ],
  );
}

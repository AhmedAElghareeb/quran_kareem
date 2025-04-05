import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/widgets/item_tile_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: AppSpaces.infinitySide,
          margin: EdgeInsetsDirectional.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              ItemTileWidget(
                title: 'surahEn'.tr(),
                subTitle: 'surahEn'.tr(),
              ),
              ItemTileWidget(
                title: 'surahAr'.tr(),
                subTitle: 'surahAr'.tr(),
              ),
              ItemTileWidget(
                title: 'surahAyat'.tr(),
                subTitle: 'surahAyat'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

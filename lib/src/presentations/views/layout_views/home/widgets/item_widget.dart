import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/helpers/navigation_helper.dart';
import 'package:quran_kareem/core/helpers/nullable_extensions.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/core/utils/app_routes.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/src/data/models/api_models/surah_model.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/widgets/item_tile_widget.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationHelper.onPushNamedWithContext(context,
            route: AppRoutes.readingScreen,
            arguments: {
              'ayaNumber': surah.number.orZero(),
              'ayaName' : surah.name.orEmpty(),
            });
        debugPrint("Tap onSurah => ${surah.number}");
      },
      child: Container(
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
              subTitle: surah.englishName.orEmpty(),
            ),
            ItemTileWidget(
              title: 'surahAr'.tr(),
              subTitle: surah.name.orEmpty(),
            ),
            ItemTileWidget(
              title: 'surahAyat'.tr(),
              subTitle: surah.numberOfAyahs.orZero().toString(),
            ),
          ],
        ),
      ),
    );
  }
}

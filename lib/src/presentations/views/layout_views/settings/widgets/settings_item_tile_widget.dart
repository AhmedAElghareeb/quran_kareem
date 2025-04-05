import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/core/utils/app_styles.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/svg_image_widget.dart';

class SettingsItemTileWidget extends StatelessWidget {
  const SettingsItemTileWidget({
    super.key,
    this.leadingIconPath,
    this.title,
    this.trailingIconPath,
    this.onTap,
    this.side,
  });

  final String? leadingIconPath;
  final String? title;
  final String? trailingIconPath;
  final VoidCallback? onTap;
  final double? side;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgImageWidget(
        image: leadingIconPath ?? AppAssets.quran,
        side: side ?? 25.sp,
        color: AppColors.primaryColor,
      ),
      title: Text(
        title ?? 'settings'.tr(),
        style: AppStyles.titleStyle.copyWith(
          color: AppColors.primaryColor,
          fontSize: 18.sp,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20.sp,
        color: AppColors.primaryColor,
      ),
      onTap: onTap,
    );
  }
}

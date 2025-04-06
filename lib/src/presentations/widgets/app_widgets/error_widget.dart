import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/core/utils/app_styles.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    super.key,
    this.errorMessage,
    this.onPressed,
  });

  final String? errorMessage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpaces.horizontalPadding5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              errorMessage ?? 'unknownError'.tr(),
            ),
          ),
          AppSpaces.verticalSpace5,
          Center(
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                'tryAgain'.tr(),
                style: AppStyles.titleStyle.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

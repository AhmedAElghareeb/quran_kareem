import 'package:flutter/material.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/core/utils/app_styles.dart';

class ItemTileWidget extends StatelessWidget {
  const ItemTileWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 3,
            style: AppStyles.titleStyle,
          ),
        ),
        AppSpaces.horizontalDefaultSpace1,
        Expanded(
          child: Text(
            subTitle,
            maxLines: 3,
            style: AppStyles.subTitleStyle,
          ),
        ),
      ],
    );
  }
}

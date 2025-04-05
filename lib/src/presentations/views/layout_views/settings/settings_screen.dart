import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/constants/api_endPoints.dart';
import 'package:quran_kareem/core/helpers/url_launcher_helper.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/settings/cubit/settings_cubit.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/settings/widgets/settings_header_widget.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/settings/widgets/settings_item_tile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            final cubit = SettingsCubit.get(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  AppSpaces.verticalSpace4,
                  SettingsHeaderWidget(),
                  AppSpaces.verticalSpace4,
                  SettingsItemTileWidget(
                    title: 'language'.tr(),
                    leadingIconPath: AppAssets.language,
                    side: 28.sp,
                    onTap: () async => cubit.changeLanguage(context),
                  ),
                  AppSpaces.verticalSpace2,
                  SettingsItemTileWidget(
                    title: 'privacy'.tr(),
                    leadingIconPath: AppAssets.privacy,
                    onTap: () async => await UrlLauncherHelper.openUrl(
                      url: ApiEndPoints.privacyPolicy,
                    ),
                  ),
                  AppSpaces.verticalSpace2,
                  SettingsItemTileWidget(
                    title: 'terms'.tr(),
                    leadingIconPath: AppAssets.terms,
                    onTap: () async => await UrlLauncherHelper.openUrl(
                      url: ApiEndPoints.termsAndConditions,
                    ),
                  ),
                  AppSpaces.verticalSpace2,
                  SettingsItemTileWidget(
                    title: 'about'.tr(),
                    leadingIconPath: AppAssets.about,
                    onTap: () async => await UrlLauncherHelper.openUrl(
                      url: ApiEndPoints.aboutUs,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

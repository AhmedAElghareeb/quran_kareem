import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:quran_kareem/core/helpers/navigation_helper.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/core/utils/app_router.dart';
import 'package:quran_kareem/core/utils/app_routes.dart';
import 'package:quran_kareem/core/utils/app_theme.dart';

class QuranKareem extends StatelessWidget {
  const QuranKareem({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => RefreshConfiguration(
        headerBuilder: () => MaterialClassicHeader(
          backgroundColor: AppColors.primaryColor,
          color: AppColors.whiteColor,
        ),
        footerBuilder: () => ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
          loadingText: 'loadingMore_ae'.tr(),
          noDataText: 'noData_ae'.tr(),
          failedText: 'failed_ae'.tr(),
          idleText: 'canLoading_ae'.tr(),
        ),
        headerTriggerDistance: 10,
        maxOverScrollExtent: 30,
        maxUnderScrollExtent: 0,
        enableScrollWhenRefreshCompleted: true,
        enableLoadingWhenFailed: true,
        hideFooterWhenNotFull: false,
        enableBallisticLoad: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quran Kareem',
          theme: AppTheme.lightTheme,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: widget!,
            );
          },
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: NavigationHelper.navigatorKey,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
          onGenerateInitialRoutes: (initialRoute) =>
              AppRouter.onGenerateInitialRoutes(initialRoute),
        ),
      ),
    );
  }
}

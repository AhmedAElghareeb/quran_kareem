import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/helpers/navigation_helper.dart';
import 'package:quran_kareem/core/utils/app_router.dart';
import 'package:quran_kareem/core/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const QuranKareem());
}

class QuranKareem extends StatelessWidget {
  const QuranKareem({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quran Kareem',
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: widget!,
          );
        },
        navigatorKey: NavigationHelper.navigatorKey,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        onGenerateInitialRoutes: (initialRoute) =>
            AppRouter.onGenerateInitialRoutes(initialRoute),
      ),
    );
  }
}

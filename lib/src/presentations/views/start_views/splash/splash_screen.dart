import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_assets.dart';
import 'package:quran_kareem/src/presentations/views/start_views/splash/cubit/splash_cubit.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/image_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: ImageWidget(
              assetImage: AppAssets.logo,
              height: 150.sp,
              width: 150.sp,
            ),
          ),
        );
      },
    );
  }
}

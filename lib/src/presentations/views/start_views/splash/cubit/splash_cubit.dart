import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_kareem/core/helpers/navigation_helper.dart';
import 'package:quran_kareem/core/utils/app_routes.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(context) => BlocProvider.of(context);

  void onInitializeSplash() async => await Future.wait([_handleSplashRoute()]);

  Future<void> _handleSplashRoute() async {
    await Future.delayed(const Duration(seconds: 3), () {
      NavigationHelper.onPushReplacementNamed(route: AppRoutes.layout);
      emit(SplashCompleted());
    });
  }
}

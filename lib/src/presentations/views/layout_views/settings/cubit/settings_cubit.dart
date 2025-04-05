import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_kareem/core/constants/cache_constants.dart';
import 'package:quran_kareem/core/helpers/cache_helper.dart';
import 'package:quran_kareem/core/helpers/localization_helper.dart';
import 'package:quran_kareem/core/utils/app_settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  void changeLanguage(BuildContext context) async {
    final isCurrentlyArabic = AppSettings.isArabic(context);
    final newLocale =
        (isCurrentlyArabic) ? const Locale('en') : const Locale('ar');
    final newLangCode = newLocale.languageCode;
    await EasyLocalizationHelper.changeLanguage(
      context,
      locale: newLocale,
    );
    CacheHelper.setStringData(
      key: CacheConstants.language,
      value: newLangCode,
    );
    emit(SettingsUpdated());
  }
}

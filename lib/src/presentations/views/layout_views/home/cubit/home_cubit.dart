import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_kareem/src/data/models/api_models/surah_model.dart';
import 'package:quran_kareem/src/data/models/error_model.dart';
import 'package:quran_kareem/src/data/services/surah_sevice.dart';
import 'package:quran_kareem/src/service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final _surahService = locator<SurahService>();

  final List<SurahModel> surahList = [];

  void initData() async {
    _getSurah();
  }

  void refreshData() async => _getSurah();

  Future<void> _getSurah() async {
    emit(HomeLoadingState());
    final result = await _surahService.getSurah();
    result.fold(
      (error) => emit(HomeErrorState(errorModel: error)),
      (success) {
        surahList.clear();
        surahList.addAll(success.data ?? []);
        emit(HomeLoadedState());
      },
    );
  }
}

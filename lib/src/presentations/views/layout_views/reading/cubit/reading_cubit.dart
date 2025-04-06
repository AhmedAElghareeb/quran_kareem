import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/src/data/models/api_models/ayat_model.dart';
import 'package:quran_kareem/src/data/models/error_model.dart';
import 'package:quran_kareem/src/data/services/surah_sevice.dart';
import 'package:quran_kareem/src/service_locator.dart';

part 'reading_state.dart';

class ReadingCubit extends Cubit<ReadingState> {
  ReadingCubit() : super(ReadingInitial());

  static ReadingCubit get(context) => BlocProvider.of(context);

  final _surahService = locator<SurahService>();

  AyaytModel? ayatModel;

  int? ayaNumber;

  void initData({int? ayaNumber}) async {
    _getAyat(ayaNumber: ayaNumber);
  }

  Future<void> _getAyat({int? ayaNumber}) async {
    this.ayaNumber ??= ayaNumber;
    emit(ReadingLoadingState());
    final result = await _surahService.getAyat(
      ayaNumber: ayaNumber!,
    );
    result.fold(
      (error) => emit(ReadingErrorState(errorModel: error)),
      (success) {
        ayatModel = success.data;
        emit(ReadingLoadedState());
      },
    );
  }
}

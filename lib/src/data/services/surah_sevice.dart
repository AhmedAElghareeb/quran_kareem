import 'package:dartz/dartz.dart';
import 'package:quran_kareem/core/constants/api_endPoints.dart';
import 'package:quran_kareem/core/network/api_manager_helper.dart';
import 'package:quran_kareem/core/network/dio_helper.dart';
import 'package:quran_kareem/src/data/models/api_models/ayat_model.dart';
import 'package:quran_kareem/src/data/models/api_models/surah_model.dart';
import 'package:quran_kareem/src/data/models/base_response_model.dart';
import 'package:quran_kareem/src/data/models/error_model.dart';

class SurahService with ApiManager {
  Future<Either<ErrorModel, BaseResponseModel<List<SurahModel>>>>
      getSurah() async => super.handleApiRequest(
            () async {
              final response = await DioHelper.getData(
                url: ApiEndPoints.surah,
              );
              return super.handleResponseError(
                response,
                200,
                BaseResponseModel<List<SurahModel>>.fromJson(
                  response.data,
                  (json) => json == null
                      ? []
                      : List<SurahModel>.from(
                          json.map(
                            (x) => SurahModel.fromJson(x),
                          ),
                        ),
                ),
              );
            },
          );

  Future<Either<ErrorModel, BaseResponseModel<AyaytModel>>> getAyat({
    required int ayaNumber,
  }) async =>
      super.handleApiRequest(
        () async {
          final response = await DioHelper.getData(
            url: "${ApiEndPoints.ayat}/$ayaNumber/ar.alafasy",
          );
          return super.handleResponseError(
            response,
            200,
            BaseResponseModel<AyaytModel>.fromJson(
              response.data,
              (json) => AyaytModel.fromJson(json),
            ),
          );
        },
      );
}

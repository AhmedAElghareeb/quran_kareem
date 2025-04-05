import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/core/utils/app_styles.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/reading/cubit/reading_cubit.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/error_widget.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({
    super.key,
    required this.ayaName,
  });

  final String ayaName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ayaName,
          style: AppStyles.titleStyle.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: BlocBuilder<ReadingCubit, ReadingState>(
        builder: (context, state) {
          final cubit = ReadingCubit.get(context);
          switch (state) {
            case ReadingLoadingState():
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  strokeWidth: 3,
                ),
              );
            case ReadingLoadedState():
              return SingleChildScrollView(
                padding: AppSpaces.horizontalPadding3,
                child: Column(
                  children: [
                    AppSpaces.verticalSpace4,
                    SelectableText.rich(
                      TextSpan(
                        children: cubit.ayatModel?.ayahs
                            ?.map(
                              (e) => TextSpan(
                                text: '${e.text} {${e.numberInSurah}} ',
                                style: AppStyles.titleStyle.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppSpaces.verticalSpace4,
                  ],
                ),
              );
            case ReadingErrorState():
              return ErrorStateWidget(
                errorMessage: state.errorModel.message,
                onPressed: () => cubit.initData(
                  ayaNumber: cubit.ayaNumber,
                ),
              );
            default:
              return Center(
                child: Text('unknownError'.tr()),
              );
          }
        },
      ),
    );
  }
}

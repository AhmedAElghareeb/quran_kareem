import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/cubit/home_cubit.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/widgets/home_loading_widget.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/widgets/item_widget.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/error_widget.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            switch (state) {
              case HomeLoadingState():
                return const HomeLoadingWidget();
              case HomeLoadedState():
                return RefreshIndicator(
                  onRefresh: () => Future(() => cubit.refreshData()),
                  backgroundColor: AppColors.primaryColor,
                  color: AppColors.whiteColor,
                  child: CustomScrollView(
                    slivers: [
                      SliverList.builder(
                        itemBuilder: (_, index) => ItemWidget(
                          surah: cubit.surahList[index],
                        ),
                        itemCount: cubit.surahList.length,
                      ),
                    ],
                  ),
                );
              case HomeErrorState():
                return ErrorStateWidget(
                  errorMessage: state.errorModel.message,
                  onPressed: () => cubit.initData(),
                );
              default:
                return Center(
                  child: Text('unknownError'.tr()),
                );
            }
          },
        ),
      ),
    );
  }
}

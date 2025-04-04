import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/helpers/nullable_extensions.dart';
import 'package:quran_kareem/core/utils/app_spaces.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/cubit/home_cubit.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/widgets/item_widget.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/image_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            switch (state) {
              case HomeLoadingState():
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.lightGreenAccent,
                  ),
                );
              case HomeLoadedState():
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 200.sp,
                      flexibleSpace: FlexibleSpaceBar(
                        background: ImageWidget(
                          assetImage: 'assets/images/quran.png',
                          height: 150.sp,
                          width: 100.sp,
                        ),
                      ),
                    ),
                    SliverList.builder(
                      itemBuilder: (_, index) => ItemWidget(
                        surah: cubit.surahList[index],
                      ),
                      itemCount: cubit.surahList.length,
                    ),
                  ],
                );
              case HomeErrorState():
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.errorModel.message.orEmpty(),
                    ),
                    AppSpaces.verticalDefaultSpace1,
                    ElevatedButton(
                      onPressed: () => cubit.initData(),
                      child: Text(
                        'Try Again',
                      ),
                    ),
                  ],
                );
              default:
                return const Center(
                  child: Text('Unknown state'),
                );
            }
          },
        ),
      ),
    );
  }
}

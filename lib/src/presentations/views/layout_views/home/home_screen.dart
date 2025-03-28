import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/cubit/home_cubit.dart';
import 'package:quran_kareem/src/presentations/widgets/app_widgets/image_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
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
                SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.80,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (_, index) =>
                      Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsetsDirectional.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: (index % 2 == 0) ? Colors.red : Colors.blue,
                        ),
                      ),
                  itemCount: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

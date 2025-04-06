import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/cubit/home_cubit.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/settings/cubit/settings_cubit.dart';

abstract class AppProviders {
  static List<SingleChildWidget> providers = [
    BlocProvider(
      create: (_) => HomeCubit()..initData(),
    ),
    BlocProvider(
      create: (_) => SettingsCubit(),
    ),
  ];
}

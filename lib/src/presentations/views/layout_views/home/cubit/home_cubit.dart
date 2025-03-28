import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
}

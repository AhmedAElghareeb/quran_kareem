import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class ToastHelper {
  static void onShowToast({required String? message, ToastGravity? gravity}) =>
      Fluttertoast.showToast(
        msg: message ?? '',
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity ?? ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.black54.withOpacity(0.6),
        fontSize: 16,
      );
}

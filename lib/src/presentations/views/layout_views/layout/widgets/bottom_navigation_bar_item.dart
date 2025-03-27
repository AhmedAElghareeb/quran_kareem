import 'package:flutter/cupertino.dart';

BottomNavigationBarItem buildBottomNavigationBarItem({
  IconData? icon,
  Color? color,
  String? title,
}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: title,
  );
}

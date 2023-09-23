import 'package:flutter/material.dart';

import '../colors/colors_custom.dart';

ElevatedButton ElevatedButtonCuston(Widget child) {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(COLOR_COFFEE),
        fixedSize: MaterialStateProperty.all(const Size(80, 80))),
    child: child,
  );
}

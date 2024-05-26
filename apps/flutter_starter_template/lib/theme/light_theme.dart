import 'package:flutter/material.dart';
import 'package:flutter_starter_template/theme/common_theme.dart';

const colorScheme = ColorScheme.light(
  primary: primaryColor,
);

final lightTheme = commonTheme.copyWith(
  brightness: Brightness.light,
  colorScheme: colorScheme,
);

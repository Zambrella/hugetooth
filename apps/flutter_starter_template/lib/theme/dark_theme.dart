import 'package:flutter/material.dart';
import 'package:flutter_starter_template/theme/common_theme.dart';

const colorScheme = ColorScheme.dark(
  primary: primaryColor,
);

final darkTheme = commonTheme.copyWith(
  brightness: Brightness.dark,
  colorScheme: colorScheme,
);

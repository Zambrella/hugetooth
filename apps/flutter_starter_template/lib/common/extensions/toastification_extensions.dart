import 'package:flutter/material.dart';
import 'package:flutter_starter_template/theme/theme.dart';
import 'package:toastification/toastification.dart';

extension ToastificationX on Toastification {
  ToastificationItem showSuccess({required BuildContext context, required String message}) {
    return show(
      context: context,
      title: Text(message),
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      primaryColor: context.theme.semanticColors.success,
      backgroundColor: HSLColor.fromColor(context.theme.semanticColors.success).withLightness(0.98).toColor(),
      foregroundColor: context.theme.semanticColors.success,
      autoCloseDuration: const Duration(seconds: 5),
      borderRadius: BorderRadius.circular(context.theme.appRadius.medium),
      progressBarTheme: ProgressIndicatorThemeData(
        color: context.theme.semanticColors.success,
        linearTrackColor: context.theme.semanticColors.success.withOpacity(0.2),
        linearMinHeight: 2,
      ),
      closeOnClick: true,
      pauseOnHover: true,
      dismissDirection: DismissDirection.vertical,
    );
  }

  ToastificationItem showWarning({required BuildContext context, required String message}) {
    return show(
      context: context,
      title: Text(message),
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      primaryColor: context.theme.semanticColors.warning,
      backgroundColor: HSLColor.fromColor(context.theme.semanticColors.warning).withLightness(0.98).toColor(),
      foregroundColor: context.theme.semanticColors.warning,
      autoCloseDuration: const Duration(seconds: 5),
      borderRadius: BorderRadius.circular(context.theme.appRadius.medium),
      progressBarTheme: ProgressIndicatorThemeData(
        color: context.theme.semanticColors.warning,
        linearTrackColor: context.theme.semanticColors.warning.withOpacity(0.2),
        linearMinHeight: 2,
      ),
      closeOnClick: true,
      pauseOnHover: true,
      dismissDirection: DismissDirection.vertical,
    );
  }

  ToastificationItem showError({required BuildContext context, required String message}) {
    return show(
      context: context,
      title: Text(message),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      primaryColor: context.theme.semanticColors.error,
      backgroundColor: HSLColor.fromColor(context.theme.semanticColors.error).withLightness(0.98).toColor(),
      foregroundColor: context.theme.semanticColors.error,
      borderRadius: BorderRadius.circular(context.theme.appRadius.medium),
      progressBarTheme: ProgressIndicatorThemeData(
        color: context.theme.semanticColors.error,
        linearTrackColor: context.theme.semanticColors.error.withOpacity(0.2),
        linearMinHeight: 2,
      ),
      closeOnClick: true,
      pauseOnHover: true,
      dismissDirection: DismissDirection.vertical,
      showProgressBar: false,
    );
  }
}

import 'package:flutter/material.dart';

class SnackBarWidget extends SnackBar {
  const SnackBarWidget({
    super.key,
    required super.content,
    super.backgroundColor,
    super.duration,
    super.behavior,
    super.margin,
  });

  factory SnackBarWidget.neutral(BuildContext context, String message, {Duration? duration}) {
    return SnackBarWidget(
      content: Text(message),
      duration: duration ?? const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: _calculateBottomMargin(context),
        left: 8,
        right: 8,
      ),
    );
  }

  factory SnackBarWidget.success(BuildContext context, String message, {Duration? duration}) {
    return SnackBarWidget(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      duration: duration ?? const Duration(seconds: 1),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: _calculateBottomMargin(context),
        left: 8,
        right: 8,
      ),
    );
  }

  factory SnackBarWidget.error(BuildContext context, String message, {Duration? duration}) {
    return SnackBarWidget(
      content: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.onError),
      ),
      duration: duration ?? const Duration(milliseconds: 4000),
      backgroundColor: Theme.of(context).colorScheme.error,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: _calculateBottomMargin(context),
        left: 8,
        right: 8,
      ),
    );
  }
}

double _calculateBottomMargin(BuildContext context) {
  final preferredBottom = MediaQuery.of(context).size.height - 80;
  final viewInsets = EdgeInsets.fromViewPadding(View.of(context).viewInsets, View.of(context).devicePixelRatio);

  return preferredBottom - viewInsets.bottom;
}

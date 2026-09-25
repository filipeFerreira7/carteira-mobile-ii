import 'package:flutter/material.dart';
import '../badge/model.dart';
import '../card/model.dart';
import 'model.dart';
import 'snackbar.dart';

class SnackBarFactory {
  static AppSnackBar info({
    required String title,
    required String description,
    List<CardAction> actions = const [],
    BadgeStyle style = BadgeStyle.solid,
  }) {
    return AppSnackBar(
      viewModel: SnackBarViewModel(
        icon: Icons.info_outline,
        title: title,
        description: description,
        actions: actions,
        color: BadgeColor.info,
        style: style,
      ),
    );
  }

  static AppSnackBar success({
    required String title,
    required String description,
    List<CardAction> actions = const [],
    BadgeStyle style = BadgeStyle.solid,
  }) {
    return AppSnackBar(
      viewModel: SnackBarViewModel(
        icon: Icons.check_circle_outline,
        title: title,
        description: description,
        actions: actions,
        color: BadgeColor.success,
        style: style,
      ),
    );
  }

  static AppSnackBar warning({
    required String title,
    required String description,
    List<CardAction> actions = const [],
    BadgeStyle style = BadgeStyle.solid,
  }) {
    return AppSnackBar(
      viewModel: SnackBarViewModel(
        icon: Icons.warning_amber_outlined,
        title: title,
        description: description,
        actions: actions,
        color: BadgeColor.warning,
        style: style,
      ),
    );
  }

  static AppSnackBar error({
    required String title,
    required String description,
    List<CardAction> actions = const [],
    BadgeStyle style = BadgeStyle.solid,
  }) {
    return AppSnackBar(
      viewModel: SnackBarViewModel(
        icon: Icons.error_outline,
        title: title,
        description: description,
        actions: actions,
        color: BadgeColor.error,
        style: style,
      ),
    );
  }
}

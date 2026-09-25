import 'package:flutter/material.dart';
import '../badge/model.dart';
import 'chip.dart';
import 'model.dart';

class ChipFactory {
  static AppChip solid(
    String label, {
    BadgeColor color = BadgeColor.primary,
    IconData? leadingIcon,
    VoidCallback? onDeleted,
    VoidCallback? onTap,
  }) {
    return AppChip(
      viewModel: ChipViewModel(
        label: label,
        color: color,
        style: BadgeStyle.solid,
        leadingIcon: leadingIcon,
        onDeleted: onDeleted,
      ),
      onTap: onTap,
    );
  }

  static AppChip outline(
    String label, {
    BadgeColor color = BadgeColor.primary,
    IconData? leadingIcon,
    VoidCallback? onDeleted,
    VoidCallback? onTap,
  }) {
    return AppChip(
      viewModel: ChipViewModel(
        label: label,
        color: color,
        style: BadgeStyle.outline,
        leadingIcon: leadingIcon,
        onDeleted: onDeleted,
      ),
      onTap: onTap,
    );
  }
}

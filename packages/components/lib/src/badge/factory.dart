import 'package:flutter/material.dart';
import 'badge.dart';
import 'model.dart';

class BadgeFactory {
  static AppBadge solid(
    String label, {
    BadgeColor color = BadgeColor.primary,
    BadgeSize size = BadgeSize.medium,
    VoidCallback? onTap,
  }) {
    return AppBadge(
      viewModel: BadgeViewModel(
        label: label,
        color: color,
        style: BadgeStyle.solid,
        size: size,
      ),
      onTap: onTap,
    );
  }

  static AppBadge outline(
    String label, {
    BadgeColor color = BadgeColor.primary,
    BadgeSize size = BadgeSize.medium,
    VoidCallback? onTap,
  }) {
    return AppBadge(
      viewModel: BadgeViewModel(
        label: label,
        color: color,
        style: BadgeStyle.outline,
        size: size,
      ),
      onTap: onTap,
    );
  }
}

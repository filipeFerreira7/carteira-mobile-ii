import 'package:flutter/material.dart';
import 'app_badge.dart';
import 'badge_model.dart';

class BadgeFactory {
  static Widget solid(
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

  static Widget outline(
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

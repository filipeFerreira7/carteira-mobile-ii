import 'package:flutter/material.dart';
import '../../tokens/app_radius.dart';
import '../../theme/app_semantic_colors.dart';
import 'badge_model.dart';

class AppBadge extends StatelessWidget {

  const AppBadge({
    super.key,
    required this.viewModel,
    this.onTap,
  });
  final BadgeViewModel viewModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final bgColor = _getBackgroundColor(context);
    final textColor = _getTextColor(context);
    final borderColor = _getBorderColor(context);
    final height = _getHeight();
    final textStyle = _getTextStyle(theme);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: AppRadius.pillAll,
          border: borderColor != null ? Border.all(color: borderColor) : null,
        ),
        child: Center(
          widthFactor: 1.0,
          child: Text(
            viewModel.label,
            style: textStyle.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    final theme = Theme.of(context);
    final semantic = context.semanticColors;

    if (viewModel.style == BadgeStyle.outline) {
      return Colors.transparent;
    }

    switch (viewModel.color) {
      case BadgeColor.primary:
        return theme.colorScheme.primary;
      case BadgeColor.success:
        return semantic.income;
      case BadgeColor.info:
        return theme.colorScheme.primaryContainer;
      case BadgeColor.warning:
        return semantic.warning;
      case BadgeColor.error:
        return theme.colorScheme.error;
    }
  }

  Color _getTextColor(BuildContext context) {
    final theme = Theme.of(context);
    final semantic = context.semanticColors;

    if (viewModel.style == BadgeStyle.outline) {
      switch (viewModel.color) {
        case BadgeColor.primary: return theme.colorScheme.primary;
        case BadgeColor.success: return semantic.income;
        case BadgeColor.info: return theme.colorScheme.primary;
        case BadgeColor.warning: return semantic.warning;
        case BadgeColor.error: return theme.colorScheme.error;
      }
    }
    
    switch (viewModel.color) {
      case BadgeColor.info:
        return theme.colorScheme.onPrimaryContainer;
      default:
        return theme.colorScheme.onPrimary;
    }
  }

  Color? _getBorderColor(BuildContext context) {
    final theme = Theme.of(context);
    final semantic = context.semanticColors;

    if (viewModel.style == BadgeStyle.outline) {
      switch (viewModel.color) {
        case BadgeColor.primary: return theme.colorScheme.primary;
        case BadgeColor.success: return semantic.income;
        case BadgeColor.info: return theme.colorScheme.primary;
        case BadgeColor.warning: return semantic.warning;
        case BadgeColor.error: return theme.colorScheme.error;
      }
    }
    return null;
  }

  double _getHeight() {
    switch (viewModel.size) {
      case BadgeSize.medium: return 24;
      case BadgeSize.small: return 20;
      case BadgeSize.tiny: return 16;
    }
  }

  TextStyle _getTextStyle(ThemeData theme) {
    switch (viewModel.size) {
      case BadgeSize.medium:
        return theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold) ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
      case BadgeSize.small:
        return theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold) ?? const TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
      case BadgeSize.tiny:
        return theme.textTheme.labelSmall?.copyWith(fontSize: 8, fontWeight: FontWeight.bold) ?? const TextStyle(fontSize: 8, fontWeight: FontWeight.bold);
    }
  }
}

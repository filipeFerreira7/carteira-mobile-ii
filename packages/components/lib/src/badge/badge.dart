import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_typography.dart';
import 'model.dart';

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
    final bgColor = _getBackgroundColor();
    final textColor = _getTextColor();
    final borderColor = _getBorderColor();
    final height = _getHeight();
    final textStyle = _getTextStyle();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
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

  Color _getBackgroundColor() {
    if (viewModel.style == BadgeStyle.outline) {
      switch (viewModel.color) {
        case BadgeColor.primary: return AppColors.primaryLightest;
        case BadgeColor.success: return AppColors.successLight;
        case BadgeColor.info: return AppColors.infoLight;
        case BadgeColor.warning: return AppColors.warningLight;
        case BadgeColor.error: return AppColors.errorLight;
      }
    }
    switch (viewModel.color) {
      case BadgeColor.primary: return AppColors.primary;
      case BadgeColor.success: return AppColors.success;
      case BadgeColor.info: return AppColors.info;
      case BadgeColor.warning: return AppColors.warning;
      case BadgeColor.error: return AppColors.error;
    }
  }

  Color _getTextColor() {
    if (viewModel.style == BadgeStyle.outline) {
      switch (viewModel.color) {
        case BadgeColor.primary: return AppColors.primary;
        case BadgeColor.success: return AppColors.success;
        case BadgeColor.info: return AppColors.info;
        case BadgeColor.warning: return AppColors.warning;
        case BadgeColor.error: return AppColors.error;
      }
    }
    return AppColors.white;
  }

  Color? _getBorderColor() {
    if (viewModel.style == BadgeStyle.outline) {
      switch (viewModel.color) {
        case BadgeColor.primary: return AppColors.primary;
        case BadgeColor.success: return AppColors.success;
        case BadgeColor.info: return AppColors.info;
        case BadgeColor.warning: return AppColors.warning;
        case BadgeColor.error: return AppColors.error;
      }
    }
    return null;
  }

  double _getHeight() {
    switch (viewModel.size) {
      case BadgeSize.medium: return AppDimensions.badgeMedium;
      case BadgeSize.small: return AppDimensions.badgeSmall;
      case BadgeSize.tiny: return AppDimensions.badgeTiny;
    }
  }

  TextStyle _getTextStyle() {
    switch (viewModel.size) {
      case BadgeSize.medium: return AppTypography.badgeLabelMedium;
      case BadgeSize.small: return AppTypography.badgeLabelSmall;
      case BadgeSize.tiny: return AppTypography.badgeLabelTiny;
    }
  }
}

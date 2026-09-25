import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_typography.dart';
import '../badge/model.dart';
import 'model.dart';

class AppChip extends StatelessWidget {

  const AppChip({
    super.key,
    required this.viewModel,
    this.onTap,
  });
  final ChipViewModel viewModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bgColor = _getBackgroundColor();
    final textColor = _getTextColor();
    final borderColor = _getBorderColor();
    const height = AppDimensions.badgeMedium;
    const textStyle = AppTypography.badgeLabelMedium;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          border: borderColor != null ? Border.all(color: borderColor) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (viewModel.leadingIcon != null) ...[
              Icon(
                viewModel.leadingIcon,
                size: 16,
                color: textColor,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              viewModel.label,
              style: textStyle.copyWith(color: textColor),
            ),
            if (viewModel.onDeleted != null) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: viewModel.onDeleted,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: textColor,
                ),
              ),
            ],
          ],
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
}

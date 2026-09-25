import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_spacing.dart';
import '../../common/theme/app_typography.dart';
import '../badge/model.dart';
import 'model.dart';

class AppSnackBar extends StatelessWidget {

  const AppSnackBar({
    super.key,
    required this.viewModel,
  });
  final SnackBarViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final bgColor = _getBackgroundColor();
    final contentColor = _getContentColor();
    final borderColor = _getBorderColor();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppDimensions.alertRadius),
        border: borderColor != null ? Border.all(color: borderColor) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            viewModel.icon,
            color: contentColor,
            size: 24,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  viewModel.title,
                  style: AppTypography.alertTitle.copyWith(color: contentColor),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  viewModel.description,
                  style: AppTypography.alertDescription.copyWith(color: contentColor),
                ),
                if (viewModel.actions.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: viewModel.actions.map((action) {
                      return Padding(
                        padding: const EdgeInsets.only(left: AppSpacing.sm),
                        child: TextButton(
                          onPressed: action.onTap,
                          style: TextButton.styleFrom(
                            foregroundColor: contentColor,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            action.label,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
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

  Color _getContentColor() {
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

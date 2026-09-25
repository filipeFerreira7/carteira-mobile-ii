import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_spacing.dart';
import '../../common/theme/app_typography.dart';
import 'model.dart';

class ProgressBar extends StatefulWidget {

  const ProgressBar({
    super.key,
    required this.viewModel,
  });
  final ProgressBarViewModel viewModel;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  bool _isHovered = false;
  bool _isFocused = false;

  ProgressBarState get _currentState {
    if (!widget.viewModel.isEnabled || widget.viewModel.state == ProgressBarState.disabled) {
      return ProgressBarState.disabled;
    }
    if (widget.viewModel.state == ProgressBarState.active) {
      return ProgressBarState.active;
    }
    if (_isFocused) {
      return ProgressBarState.focus;
    }
    if (_isHovered) {
      return ProgressBarState.hover;
    }
    return ProgressBarState.defaultState;
  }

  @override
  Widget build(BuildContext context) {
    final state = _currentState;
    final percentage = (widget.viewModel.value * 100).toInt();
    final label = '$percentage%';

    return Focus(
      onFocusChange: (hasFocus) {
        if (widget.viewModel.isEnabled) {
          setState(() => _isFocused = hasFocus);
        }
      },
      child: MouseRegion(
        onEnter: (_) {
          if (widget.viewModel.isEnabled) {
            setState(() => _isHovered = true);
          }
        },
        onExit: (_) {
          if (widget.viewModel.isEnabled) {
            setState(() => _isHovered = false);
          }
        },
        child: Row(
          children: [
            if (widget.viewModel.labelPosition == LabelPosition.left) ...[
              Text(
                label,
                style: AppTypography.progressBarLabel.copyWith(
                  color: _getTextColor(state),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
            ],
            Expanded(
              child: _buildBar(state),
            ),
            if (widget.viewModel.labelPosition == LabelPosition.right) ...[
              const SizedBox(width: AppSpacing.sm),
              Text(
                label,
                style: AppTypography.progressBarLabel.copyWith(
                  color: _getTextColor(state),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBar(ProgressBarState state) {
    return Container(
      height: AppDimensions.progressBarHeight + (state == ProgressBarState.focus ? 4 : 0),
      padding: state == ProgressBarState.focus ? const EdgeInsets.all(2) : null,
      decoration: state == ProgressBarState.focus
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.progressBarRadius + 2),
              border: Border.all(color: AppColors.primary, width: 2),
            )
          : null,
      child: Stack(
        children: [
          // Rail
          Container(
            height: AppDimensions.progressBarHeight,
            decoration: BoxDecoration(
              color: _getRailColor(state),
              borderRadius: BorderRadius.circular(AppDimensions.progressBarRadius),
            ),
          ),
          // Fill
          LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: constraints.maxWidth * widget.viewModel.value,
                height: AppDimensions.progressBarHeight,
                decoration: BoxDecoration(
                  color: _getFillColor(state),
                  borderRadius: BorderRadius.circular(AppDimensions.progressBarRadius),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Color _getRailColor(ProgressBarState state) {
    switch (state) {
      case ProgressBarState.hover:
        return AppColors.progressBarRailHover;
      case ProgressBarState.disabled:
        return AppColors.progressBarRail.withValues(alpha: 0.5);
      default:
        return AppColors.progressBarRail;
    }
  }

  Color _getFillColor(ProgressBarState state) {
    switch (state) {
      case ProgressBarState.hover:
        return AppColors.progressBarFillHover;
      case ProgressBarState.active:
        return AppColors.progressBarFillActive;
      case ProgressBarState.disabled:
        return AppColors.progressBarDisabled;
      default:
        return AppColors.progressBarFill;
    }
  }

  Color _getTextColor(ProgressBarState state) {
    if (state == ProgressBarState.disabled) {
      return AppColors.disabledText;
    }
    return AppColors.progressBarText;
  }
}

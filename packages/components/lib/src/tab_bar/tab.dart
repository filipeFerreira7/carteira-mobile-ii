import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_spacing.dart';
import '../../common/theme/app_typography.dart';
import 'tab_view_model.dart';

class AppTab extends StatefulWidget {

  const AppTab({
    super.key,
    required this.viewModel,
  });
  final TabViewModel viewModel;

  @override
  State<AppTab> createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> {
  late TabState _internalState;
  bool _isFocused = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _internalState = widget.viewModel.state;
  }

  @override
  void didUpdateWidget(covariant AppTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel.state != widget.viewModel.state) {
      _internalState = widget.viewModel.state;
    }
  }

  TabState get _currentState {
    if (!widget.viewModel.isEnabled || _internalState == TabState.disabled) {
      return TabState.disabled;
    }
    if (_internalState == TabState.selected) {
      return TabState.selected;
    }
    if (_isFocused) {
      return TabState.focus;
    }
    if (_isHovered) {
      return TabState.hover;
    }
    return _internalState;
  }

  @override
  Widget build(BuildContext context) {
    final state = _currentState;

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
        cursor: widget.viewModel.isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: widget.viewModel.isEnabled ? widget.viewModel.onTap : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.tabPaddingHorizontal,
              vertical: AppSpacing.tabPaddingVertical,
            ),
            decoration: _buildDecoration(state),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.viewModel.leftIcon != null) ...[
                  Icon(
                    widget.viewModel.leftIcon,
                    size: AppDimensions.iconSize,
                    color: _getContentColor(state),
                  ),
                  const SizedBox(width: AppSpacing.tabIconGap),
                ],
                Text(
                  widget.viewModel.label,
                  style: AppTypography.tabLabel.copyWith(
                    color: _getContentColor(state),
                  ),
                ),
                if (widget.viewModel.rightIcon != null) ...[
                  const SizedBox(width: AppSpacing.tabIconGap),
                  Icon(
                    widget.viewModel.rightIcon,
                    size: AppDimensions.iconSize,
                    color: _getContentColor(state),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(TabState state) {
    switch (state) {
      case TabState.selected:
        return BoxDecoration(
          color: AppColors.tabBackgroundSelected,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        );
      case TabState.hover:
        return BoxDecoration(
          color: AppColors.tabBackgroundHover,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
        );
      case TabState.focus:
        return BoxDecoration(
          color: AppColors.tabBackgroundTransparent,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          border: Border.all(
            color: AppColors.tabBorderFocus,
            width: AppDimensions.focusBorderWidth,
          ),
        );
      case TabState.defaultState:
      case TabState.disabled:
        return const BoxDecoration(
          color: AppColors.tabBackgroundTransparent,
        );
    }
  }

  Color _getContentColor(TabState state) {
    switch (state) {
      case TabState.selected:
        return AppColors.tabLabelSelected;
      case TabState.disabled:
        return AppColors.tabLabelDisabled;
      case TabState.hover:
      case TabState.focus:
      case TabState.defaultState:
        return AppColors.tabLabelDefault;
    }
  }
}

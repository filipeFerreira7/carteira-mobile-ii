import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_spacing.dart';
import '../../common/theme/app_typography.dart';
import 'model.dart';

class ListItem extends StatefulWidget {

  const ListItem({
    super.key,
    required this.viewModel,
  });
  final ListItemViewModel viewModel;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _isHovered = false;
  bool _isFocused = false;

  ListItemState get _currentState {
    if (!widget.viewModel.isEnabled || widget.viewModel.state == ListItemState.disabled) {
      return ListItemState.disabled;
    }
    if (widget.viewModel.state == ListItemState.selected) {
      return ListItemState.selected;
    }
    if (_isFocused) {
      return ListItemState.focus;
    }
    if (_isHovered) {
      return ListItemState.hover;
    }
    return ListItemState.defaultState;
  }

  @override
  Widget build(BuildContext context) {
    final state = _currentState;
    final isSelected = state == ListItemState.selected;
    final isDisabled = state == ListItemState.disabled;

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
          child: Opacity(
            opacity: isDisabled ? 0.5 : 1.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: _getBackgroundColor(state),
                borderRadius: BorderRadius.circular(AppDimensions.md),
                border: state == ListItemState.focus
                    ? Border.all(color: AppColors.primary, width: 2)
                    : null,
              ),
              child: Row(
                children: [
                  if (widget.viewModel.leading != null) ...[
                    _buildIconTheme(widget.viewModel.leading!, isSelected),
                    const SizedBox(width: AppSpacing.md),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.viewModel.label,
                          style: AppTypography.listItemTitle.copyWith(
                            color: _getTextColor(state, true),
                          ),
                        ),
                        if (widget.viewModel.details != null)
                          Text(
                            widget.viewModel.details!,
                            style: AppTypography.listItemDetails.copyWith(
                              color: _getTextColor(state, false),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (widget.viewModel.trailing != null) ...[
                    const SizedBox(width: AppSpacing.md),
                    _buildIconTheme(widget.viewModel.trailing!, isSelected),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconTheme(Widget child, bool isSelected) {
    if (child is Icon) {
      return Icon(
        child.icon,
        color: isSelected ? AppColors.white : child.color ?? AppColors.primary,
        size: child.size ?? 24,
      );
    }
    return child;
  }

  Color _getBackgroundColor(ListItemState state) {
    switch (state) {
      case ListItemState.selected:
        return AppColors.listItemBackgroundSelected;
      case ListItemState.hover:
        return AppColors.listItemBackgroundHover;
      case ListItemState.disabled:
        return AppColors.listItemBackgroundDisabled;
      case ListItemState.defaultState:
      case ListItemState.focus:
        return AppColors.listItemBackgroundDefault;
    }
  }

  Color _getTextColor(ListItemState state, bool isTitle) {
    if (state == ListItemState.selected) {
      return AppColors.listItemTextSelected;
    }
    if (state == ListItemState.disabled) {
      return AppColors.listItemTextDisabled;
    }
    return isTitle ? AppColors.listItemTextPrimary : AppColors.listItemTextSecondary;
  }
}

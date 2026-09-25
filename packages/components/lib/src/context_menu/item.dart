import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_spacing.dart';
import 'model.dart';

/// A single row of a context menu, with hover, press and disabled states.
///
/// Shared by [AppContextMenu] and `ContextMenuList` so a row looks the same
/// whether it is popped from a [PopupMenuButton] or rendered inside a
/// persistent list.
class ContextMenuItemTile extends StatefulWidget {
  const ContextMenuItemTile({
    super.key,
    required this.viewModel,
    this.onTap,
  });

  final MenuItemViewModel viewModel;

  /// What happens when an enabled row is tapped.
  ///
  /// Left null inside a [PopupMenuButton], where the tap has to pop the route
  /// so the button can report the selection.
  final VoidCallback? onTap;

  @override
  State<ContextMenuItemTile> createState() => _ContextMenuItemTileState();
}

class _ContextMenuItemTileState extends State<ContextMenuItemTile> {
  bool _isHovered = false;
  bool _isPressed = false;

  void _handleTap() {
    if (!widget.viewModel.isEnabled) return;
    final onTap = widget.onTap;
    if (onTap != null) {
      onTap();
    } else {
      Navigator.of(context).pop(widget.viewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.viewModel.isEnabled;
    final isDestructive = widget.viewModel.isDestructive;

    var contentColor = isDestructive ? AppColors.error : AppColors.onSurface;
    if (isDisabled) contentColor = AppColors.disabledText;

    var bgColor = Colors.transparent;
    if (_isPressed) {
      bgColor = AppColors.primaryLightest;
    } else if (_isHovered) {
      bgColor = isDestructive ? AppColors.errorLight : AppColors.grey100;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: isDisabled ? null : _handleTap,
        onHighlightChanged: (highlight) => setState(() => _isPressed = highlight),
        child: Container(
          height: AppDimensions.menuItemHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(color: bgColor),
          child: Row(
            children: [
              if (widget.viewModel.leadingIcon != null) ...[
                Icon(
                  widget.viewModel.leadingIcon,
                  size: AppDimensions.iconSize,
                  color: contentColor,
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
              Expanded(
                child: Text(
                  widget.viewModel.label,
                  style: TextStyle(
                    color: contentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (widget.viewModel.trailingIcon != null) ...[
                const SizedBox(width: AppSpacing.sm),
                Icon(
                  widget.viewModel.trailingIcon,
                  size: AppDimensions.iconSize,
                  color: contentColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

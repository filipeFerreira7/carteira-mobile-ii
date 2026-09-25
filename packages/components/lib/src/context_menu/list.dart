import 'package:flutter/material.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_colors.dart';
import 'item.dart';
import 'model.dart';

/// A component that renders a list of menu items inside a styled container.
/// This can be used for persistent menus or as the body of a dropdown.
class ContextMenuList extends StatelessWidget {

  const ContextMenuList({
    super.key,
    required this.items,
    this.onSelected,
  });
  final List<MenuItemViewModel> items;
  final ValueChanged<MenuItemViewModel>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.menuRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          return ContextMenuItemTile(
            viewModel: item,
            onTap: item.isEnabled
                ? () {
                    onSelected?.call(item);
                    item.onTap?.call();
                  }
                : null,
          );
        }).toList(),
      ),
    );
  }
}

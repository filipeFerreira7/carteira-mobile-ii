import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import 'item.dart';
import 'model.dart';

class AppContextMenu extends StatelessWidget {

  const AppContextMenu({
    super.key,
    required this.viewModel,
  });
  final ContextMenuViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemViewModel>(
      offset: const Offset(0, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.menuRadius),
      ),
      elevation: AppDimensions.menuElevation,
      color: AppColors.white,
      padding: EdgeInsets.zero,
      onSelected: (item) {
        if (item.isEnabled) {
          viewModel.onSelected?.call(item);
          item.onTap?.call();
        }
      },
      itemBuilder: (context) {
        return viewModel.items.map((item) {
          return PopupMenuItem<MenuItemViewModel>(
            value: item,
            enabled: item.isEnabled,
            padding: EdgeInsets.zero,
            height: AppDimensions.menuItemHeight,
            child: ContextMenuItemTile(viewModel: item),
          );
        }).toList();
      },
      child: viewModel.trigger,
    );
  }
}

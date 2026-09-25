import 'package:flutter/material.dart';
import 'context_menu.dart';
import 'model.dart';

class ContextMenuFactory {
  static Widget simple({
    required Widget trigger,
    required List<MenuItemViewModel> items,
    ValueChanged<MenuItemViewModel>? onSelected,
  }) {
    return AppContextMenu(
      viewModel: ContextMenuViewModel(
        trigger: trigger,
        items: items,
        onSelected: onSelected,
      ),
    );
  }

  static MenuItemViewModel item({
    required String label,
    IconData? leadingIcon,
    IconData? trailingIcon,
    bool isDestructive = false,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return MenuItemViewModel(
      label: label,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isDestructive: isDestructive,
      isEnabled: isEnabled,
      onTap: onTap,
    );
  }

  static MenuItemViewModel destructive({
    required String label,
    IconData leadingIcon = Icons.delete_outline,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return MenuItemViewModel(
      label: label,
      leadingIcon: leadingIcon,
      isDestructive: true,
      isEnabled: isEnabled,
      onTap: onTap,
    );
  }
}

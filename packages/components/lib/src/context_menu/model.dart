import 'package:flutter/material.dart';

enum ContextMenuItemState {
  defaultState,
  hover,
  focus,
  press,
  disabled,
}

class MenuItemViewModel {

  const MenuItemViewModel({
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.isDestructive = false,
    this.isEnabled = true,
    this.onTap,
  });
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool isDestructive;
  final bool isEnabled;
  final VoidCallback? onTap;
}

class ContextMenuViewModel {

  const ContextMenuViewModel({
    required this.trigger,
    required this.items,
    this.isOpen = false,
    this.onSelected,
  });
  final Widget trigger;
  final List<MenuItemViewModel> items;
  final bool isOpen;
  final ValueChanged<MenuItemViewModel>? onSelected;
}

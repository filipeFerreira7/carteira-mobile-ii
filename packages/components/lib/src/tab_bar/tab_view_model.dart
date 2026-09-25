import 'package:flutter/material.dart';

enum TabState {
  defaultState,
  hover,
  focus,
  selected,
  disabled,
}

class TabViewModel {

  const TabViewModel({
    required this.label,
    this.leftIcon,
    this.rightIcon,
    this.state = TabState.defaultState,
    this.isEnabled = true,
    this.onTap,
  });
  final String label;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final TabState state;
  final bool isEnabled;
  final VoidCallback? onTap;

  TabViewModel copyWith({
    String? label,
    IconData? leftIcon,
    IconData? rightIcon,
    TabState? state,
    bool? isEnabled,
    VoidCallback? onTap,
  }) {
    return TabViewModel(
      label: label ?? this.label,
      leftIcon: leftIcon ?? this.leftIcon,
      rightIcon: rightIcon ?? this.rightIcon,
      state: state ?? this.state,
      isEnabled: isEnabled ?? this.isEnabled,
      onTap: onTap ?? this.onTap,
    );
  }
}

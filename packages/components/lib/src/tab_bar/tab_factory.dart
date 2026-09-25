import 'package:flutter/material.dart';
import 'tab.dart';
import 'tab_view_model.dart';

class TabFactory {
  static Widget create({
    required String label,
    IconData? leftIcon,
    IconData? rightIcon,
    TabState state = TabState.defaultState,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return AppTab(
      viewModel: TabViewModel(
        label: label,
        leftIcon: leftIcon,
        rightIcon: rightIcon,
        state: state,
        isEnabled: isEnabled,
        onTap: onTap,
      ),
    );
  }

  static Widget defaultTab({
    required String label,
    IconData? leftIcon,
    IconData? rightIcon,
    VoidCallback? onTap,
  }) {
    return create(
      label: label,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      onTap: onTap,
    );
  }

  static Widget selected({
    required String label,
    IconData? leftIcon,
    IconData? rightIcon,
    VoidCallback? onTap,
  }) {
    return create(
      label: label,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      state: TabState.selected,
      onTap: onTap,
    );
  }

  static Widget disabled({
    required String label,
    IconData? leftIcon,
    IconData? rightIcon,
  }) {
    return create(
      label: label,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      isEnabled: false,
      state: TabState.disabled,
    );
  }
}

import 'package:flutter/material.dart';
import 'action_button_component.dart';
import 'action_button_view_model.dart';

/// Factory do Action Button.
/// Ponto único de criação — quem consome o Design System sempre pede pra Factory.
class ActionButtonFactory {
  static Widget create({
    required String label,
    ActionButtonVariant variant = ActionButtonVariant.primary,
    ActionButtonSize size = ActionButtonSize.medium,
    VoidCallback? onTap,
    IconData? leadingIcon,
    IconData? trailingIcon,
  }) {
    final viewModel = ActionButtonViewModel(
      label: label,
      variant: variant,
      size: size,
      onTap: onTap,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
    );
    return ActionButtonComponent(viewModel: viewModel);
  }
}

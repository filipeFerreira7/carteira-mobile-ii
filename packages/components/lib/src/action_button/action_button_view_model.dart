import 'package:flutter/widgets.dart';
import '../../common/viewmodel/base_view_model.dart';

/// Variantes do botão conforme Figma (Button.jpg).
/// - primary: fundo navy escuro (#131927), texto branco
/// - secondary: fundo azul (#4A6CF7), texto branco
/// - outline: fundo transparente, borda azul, texto azul
/// - text: sem fundo/borda, apenas texto azul
enum ActionButtonVariant { primary, secondary, outline, text }

/// Tamanhos do botão conforme Figma (Size.svg).
enum ActionButtonSize { large, medium, small, extraSmall }

/// ViewModel do componente Action Button.
/// Guarda estado (loading, enabled) e regra de interação.
class ActionButtonViewModel extends BaseViewModel {
  ActionButtonViewModel({
    required this.label,
    this.variant = ActionButtonVariant.primary,
    this.size = ActionButtonSize.medium,
    this.onTap,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String label;
  final ActionButtonVariant variant;
  final ActionButtonSize size;
  final VoidCallback? onTap;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get isEnabled => !_isLoading && onTap != null;

  Future<void> handleTap() async {
    if (!isEnabled) return;
    _isLoading = true;
    notify();
    try {
      onTap?.call();
    } finally {
      _isLoading = false;
      notify();
    }
  }

  /// Dimensões baseadas no Size.svg do Figma.
  double get height {
    switch (size) {
      case ActionButtonSize.large:
        return 52;
      case ActionButtonSize.medium:
        return 44;
      case ActionButtonSize.small:
        return 36;
      case ActionButtonSize.extraSmall:
        return 30;
    }
  }

  double get horizontalPadding {
    switch (size) {
      case ActionButtonSize.large:
        return 24;
      case ActionButtonSize.medium:
        return 20;
      case ActionButtonSize.small:
        return 16;
      case ActionButtonSize.extraSmall:
        return 12;
    }
  }

  double get fontSize {
    switch (size) {
      case ActionButtonSize.large:
        return 16;
      case ActionButtonSize.medium:
        return 14;
      case ActionButtonSize.small:
        return 13;
      case ActionButtonSize.extraSmall:
        return 12;
    }
  }

  double get iconSize {
    switch (size) {
      case ActionButtonSize.large:
        return 20;
      case ActionButtonSize.medium:
        return 18;
      case ActionButtonSize.small:
        return 16;
      case ActionButtonSize.extraSmall:
        return 14;
    }
  }

  double get borderRadius {
    switch (size) {
      case ActionButtonSize.large:
        return 14;
      case ActionButtonSize.medium:
        return 10;
      case ActionButtonSize.small:
        return 8;
      case ActionButtonSize.extraSmall:
        return 6;
    }
  }
}

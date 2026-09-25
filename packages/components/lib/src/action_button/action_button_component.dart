import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import 'action_button_view_model.dart';

/// Component (Widget puro) do Action Button.
/// Renderiza o botão conforme os estilos do Figma (Button.jpg).
class ActionButtonComponent extends StatelessWidget {
  const ActionButtonComponent({super.key, required this.viewModel});

  final ActionButtonViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final isLoading = viewModel.isLoading;
        final isEnabled = viewModel.isEnabled;
        final isDisabled = !isEnabled;

        final colors = _getColors(isDisabled);

        return Material(
          color: colors.background,
          borderRadius: BorderRadius.circular(viewModel.borderRadius),
          child: InkWell(
            onTap: isEnabled ? () => viewModel.handleTap() : null,
            borderRadius: BorderRadius.circular(viewModel.borderRadius),
            splashColor: colors.foreground.withValues(alpha: 0.12),
            highlightColor: colors.foreground.withValues(alpha: 0.06),
            child: Container(
              height: viewModel.height,
              padding: EdgeInsets.symmetric(horizontal: viewModel.horizontalPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(viewModel.borderRadius),
                border: viewModel.variant == ActionButtonVariant.outline
                    ? Border.all(
                        color: isDisabled ? AppColors.disabled : AppColors.primary,
                        width: 1.5,
                      )
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading) ...[
                    SizedBox(
                      height: viewModel.iconSize,
                      width: viewModel.iconSize,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(colors.foreground),
                      ),
                    ),
                  ] else ...[
                    if (viewModel.leadingIcon != null) ...[
                      Icon(viewModel.leadingIcon, size: viewModel.iconSize, color: colors.foreground),
                      const SizedBox(width: AppSpacing.xs),
                    ],
                    Text(
                      viewModel.label,
                      style: TextStyle(
                        fontSize: viewModel.fontSize,
                        fontWeight: FontWeight.w600,
                        color: colors.foreground,
                      ),
                    ),
                    if (viewModel.trailingIcon != null) ...[
                      const SizedBox(width: AppSpacing.xs),
                      Icon(viewModel.trailingIcon, size: viewModel.iconSize, color: colors.foreground),
                    ],
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _ButtonColors _getColors(bool isDisabled) {
    if (isDisabled) {
      return const _ButtonColors(
        background: AppColors.disabledContainer,
        foreground: AppColors.disabledText,
      );
    }

    switch (viewModel.variant) {
      case ActionButtonVariant.primary:
        return const _ButtonColors(background: AppColors.navy, foreground: AppColors.white);
      case ActionButtonVariant.secondary:
        return const _ButtonColors(background: AppColors.primary, foreground: AppColors.white);
      case ActionButtonVariant.outline:
        return const _ButtonColors(background: AppColors.white, foreground: AppColors.primary);
      case ActionButtonVariant.text:
        return const _ButtonColors(background: Colors.transparent, foreground: AppColors.primary);
    }
  }
}

class _ButtonColors {
  const _ButtonColors({required this.background, required this.foreground});
  final Color background;
  final Color foreground;
}

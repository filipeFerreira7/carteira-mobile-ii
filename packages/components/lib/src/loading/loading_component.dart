import 'package:flutter/material.dart';
import '../../common/theme/app_theme.dart';
import 'loading_view_model.dart';

/// Component (Widget puro) do Loading.
/// CircularProgressIndicator com cor e tamanho do Design System.
class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key, required this.viewModel});

  final LoadingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: viewModel.diameter,
          width: viewModel.diameter,
          child: CircularProgressIndicator(
            strokeWidth: viewModel.strokeWidth,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
        if (viewModel.message != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            viewModel.message!,
            style: TextStyle(
              fontSize: viewModel.diameter < 28 ? 11 : 13,
              color: AppColors.onSurface,
            ),
          ),
        ],
      ],
    );
  }
}

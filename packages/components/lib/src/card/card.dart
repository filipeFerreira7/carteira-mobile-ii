import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_spacing.dart';
import '../../common/theme/app_typography.dart';
import 'model.dart';

class AppCard extends StatefulWidget {

  const AppCard({
    super.key,
    required this.viewModel,
  });
  final CardViewModel viewModel;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.white : AppColors.grey100,
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.15 : 0.05),
              blurRadius: _isHovered ? 12 : 4,
              offset: Offset(0, _isHovered ? 6 : 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          child: _buildLayout(),
        ),
      ),
    );
  }

  Widget _buildLayout() {
    if (widget.viewModel.layout == CardLayout.horizontal) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.viewModel.imageUrl != null)
            SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                widget.viewModel.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: _buildContent(),
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.viewModel.imageUrl != null)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                widget.viewModel.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: _buildContent(),
          ),
        ],
      );
    }
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.viewModel.title,
          style: AppTypography.cardTitle,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          widget.viewModel.description,
          style: AppTypography.cardDescription,
        ),
        if (widget.viewModel.actions.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: widget.viewModel.actions.map((action) {
              return Padding(
                padding: const EdgeInsets.only(left: AppSpacing.sm),
                child: TextButton(
                  onPressed: action.onTap,
                  style: TextButton.styleFrom(
                    backgroundColor: action.isPrimary ? AppColors.primary : Colors.transparent,
                    foregroundColor: action.isPrimary ? AppColors.white : AppColors.primary,
                  ),
                  child: Text(action.label),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}

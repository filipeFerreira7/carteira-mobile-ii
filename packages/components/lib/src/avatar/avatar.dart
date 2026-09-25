import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_typography.dart';
import 'model.dart';

class Avatar extends StatelessWidget {

  const Avatar({
    super.key,
    required this.viewModel,
  });
  final AvatarViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final double size = _getSize();
    
    return Opacity(
      opacity: viewModel.isDisabled ? 0.5 : 1.0,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: viewModel.type == AvatarType.image ? AppColors.grey300 : AppColors.primary,
            ),
            clipBehavior: Clip.antiAlias,
            child: _buildContent(),
          ),
          if (viewModel.isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: size * 0.25,
                height: size * 0.25,
                decoration: BoxDecoration(
                  color: AppColors.statusOnline,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (viewModel.type) {
      case AvatarType.image:
        return viewModel.imageUrl != null
            ? Image.network(
                viewModel.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildInitials(),
              )
            : _buildInitials();
      case AvatarType.initials:
        return _buildInitials();
      case AvatarType.icon:
        return Icon(
          viewModel.icon ?? Icons.person,
          color: AppColors.white,
          size: _getSize() * 0.6,
        );
    }
  }

  Widget _buildInitials() {
    return Center(
      child: Text(
        viewModel.initials ?? '?',
        style: AppTypography.avatarInitial.copyWith(
          fontSize: _getSize() * 0.4,
        ),
      ),
    );
  }

  double _getSize() {
    switch (viewModel.size) {
      case AvatarSize.large:
        return AppDimensions.avatarLarge;
      case AvatarSize.medium:
        return AppDimensions.avatarMedium;
      case AvatarSize.small:
        return AppDimensions.avatarSmall;
      case AvatarSize.tiny:
        return AppDimensions.avatarTiny;
    }
  }
}

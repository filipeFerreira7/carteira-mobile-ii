import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

export 'app_colors.dart';
export 'app_dimensions.dart';
export 'app_spacing.dart';
export 'app_typography.dart';

/// Builds the [ThemeData] the Carteira components are designed against.
///
/// The components read their own tokens instead of [ColorScheme] on purpose:
/// they must render identically no matter which theme the host app installs.
/// This theme exists so an app embedding the library starts from the same
/// baseline.
abstract final class AppTheme {
  static ThemeData light() => _build(Brightness.light);

  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
    ).copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      surface: isDark ? AppColors.navy : AppColors.white,
      onSurface: isDark ? AppColors.white : AppColors.onSurface,
      error: AppColors.error,
      onError: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      dividerColor: AppColors.grey300,
      textTheme: const TextTheme(
        titleMedium: AppTypography.cardTitle,
        bodyMedium: AppTypography.cardDescription,
        labelSmall: AppTypography.badgeLabelSmall,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppColors.disabledContainer : AppColors.grey100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.md),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.md),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.md),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: AppDimensions.focusBorderWidth,
          ),
        ),
      ),
    );
  }
}

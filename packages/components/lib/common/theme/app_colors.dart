import 'package:flutter/material.dart';

/// Flat color palette shared by the Carteira components.
///
/// Every value is a `const`, so widgets can read them inside `const`
/// expressions (see `AppChip`, which builds its height and text style at
/// compile time). Colors that only differ per component state live here too,
/// named `<component><Element><State>`, which keeps the state machine of each
/// component readable at the call site.
abstract final class AppColors {
  // Brand
  static const Color navy = Color(0xFF131927);
  static const Color primary = Color(0xFF4A6CF7);
  static const Color primaryLightest = Color(0xFFE8ECFE);

  // Semantic
  static const Color success = Color(0xFF1F9D63);
  static const Color successLight = Color(0xFFE3F6EE);
  static const Color info = Color(0xFF0EA5E9);
  static const Color infoLight = Color(0xFFE0F2FE);
  static const Color warning = Color(0xFFB45309);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFFEE2E2);

  // Neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1F2933);
  static const Color grey100 = Color(0xFFF4F5F7);
  static const Color grey300 = Color(0xFFD7DBE0);

  // Disabled
  static const Color disabled = Color(0xFFC4C9D0);
  static const Color disabledContainer = Color(0xFFEEF0F3);
  static const Color disabledText = Color(0xFFA3A9B2);

  // Status
  static const Color statusOnline = Color(0xFF22C55E);

  // List item
  static const Color listItemBackgroundDefault = Color(0xFFFFFFFF);
  static const Color listItemBackgroundHover = Color(0xFFF4F6FF);
  static const Color listItemBackgroundSelected = Color(0xFFE8ECFE);
  static const Color listItemBackgroundDisabled = Color(0xFFFAFBFC);
  static const Color listItemTextPrimary = Color(0xFF1F2933);
  static const Color listItemTextSecondary = Color(0xFF6B7280);
  static const Color listItemTextSelected = Color(0xFF4A6CF7);
  static const Color listItemTextDisabled = Color(0xFFA3A9B2);

  // Progress bar
  static const Color progressBarRail = Color(0xFFE7EAF0);
  static const Color progressBarRailHover = Color(0xFFDCE0E8);
  static const Color progressBarFill = Color(0xFF4A6CF7);
  static const Color progressBarFillHover = Color(0xFF6B87F9);
  static const Color progressBarFillActive = Color(0xFF131927);
  static const Color progressBarDisabled = Color(0xFFC4C9D0);
  static const Color progressBarText = Color(0xFF1F2933);

  // Tab
  static const Color tabBackgroundSelected = Color(0xFFE8ECFE);
  static const Color tabBackgroundHover = Color(0xFFF4F6FF);
  static const Color tabBackgroundTransparent = Color(0x00000000);
  static const Color tabBorderFocus = Color(0xFF4A6CF7);
  static const Color tabLabelDefault = Color(0xFF1F2933);
  static const Color tabLabelSelected = Color(0xFF4A6CF7);
  static const Color tabLabelDisabled = Color(0xFFA3A9B2);
}

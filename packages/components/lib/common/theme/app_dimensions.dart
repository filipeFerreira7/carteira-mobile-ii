/// Corner radii and fixed sizes that belong to a single component.
///
/// This is deliberately separate from [AppSpacing]: spacing is the gap between
/// elements, dimensions are the size of the element itself.
abstract final class AppDimensions {
  // Radii
  static const double md = 10;
  static const double cardRadius = 16;
  static const double alertRadius = 12;
  static const double menuRadius = 12;
  static const double radiusFull = 999;
  static const double progressBarRadius = 999;

  // Avatar
  static const double avatarTiny = 24;
  static const double avatarSmall = 32;
  static const double avatarMedium = 40;
  static const double avatarLarge = 56;

  // Badge
  static const double badgeTiny = 16;
  static const double badgeSmall = 20;
  static const double badgeMedium = 24;

  // Icon
  static const double iconSize = 20;

  // Context menu
  static const double menuElevation = 8;
  static const double menuItemHeight = 40;

  // Progress bar
  static const double progressBarHeight = 8;

  // Focus ring
  static const double focusBorderWidth = 2;
}

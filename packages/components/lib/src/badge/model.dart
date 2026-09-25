enum BadgeColor { primary, success, info, warning, error }

enum BadgeStyle { solid, outline }

enum BadgeSize { tiny, small, medium }

class BadgeViewModel {

  BadgeViewModel({
    required this.label,
    this.color = BadgeColor.primary,
    this.style = BadgeStyle.solid,
    this.size = BadgeSize.medium,
  });
  final String label;
  final BadgeColor color;
  final BadgeStyle style;
  final BadgeSize size;
}

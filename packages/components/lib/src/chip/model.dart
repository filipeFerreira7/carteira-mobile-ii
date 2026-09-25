import 'package:flutter/material.dart';
import '../badge/model.dart';

class ChipViewModel {

  ChipViewModel({
    required this.label,
    this.color = BadgeColor.primary,
    this.style = BadgeStyle.solid,
    this.leadingIcon,
    this.onDeleted,
  });
  final String label;
  final BadgeColor color;
  final BadgeStyle style;
  final IconData? leadingIcon;
  final VoidCallback? onDeleted;
}

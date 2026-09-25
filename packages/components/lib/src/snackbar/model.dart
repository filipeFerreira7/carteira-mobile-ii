import 'package:flutter/material.dart';
import '../badge/model.dart';
import '../card/model.dart';

class SnackBarViewModel {

  SnackBarViewModel({
    required this.icon,
    required this.title,
    required this.description,
    this.actions = const [],
    this.color = BadgeColor.info,
    this.style = BadgeStyle.solid,
  });
  final IconData icon;
  final String title;
  final String description;
  final List<CardAction> actions;
  final BadgeColor color;
  final BadgeStyle style;
}

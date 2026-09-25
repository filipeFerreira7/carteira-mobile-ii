import 'package:flutter/material.dart';

enum CardLayout { horizontal, vertical }

class CardAction {

  CardAction({
    required this.label,
    required this.onTap,
    this.isPrimary = true,
  });
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;
}

class CardViewModel {

  CardViewModel({
    this.imageUrl,
    required this.title,
    required this.description,
    this.actions = const [],
    this.layout = CardLayout.vertical,
  });
  final String? imageUrl;
  final String title;
  final String description;
  final List<CardAction> actions;
  final CardLayout layout;
}

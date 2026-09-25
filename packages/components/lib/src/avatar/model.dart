import 'package:flutter/material.dart';

enum AvatarSize { tiny, small, medium, large }

enum AvatarType { image, initials, icon }

class AvatarViewModel {

  AvatarViewModel({
    this.size = AvatarSize.medium,
    required this.type,
    this.imageUrl,
    this.initials,
    this.icon,
    this.isOnline = false,
    this.isDisabled = false,
  });
  final AvatarSize size;
  final AvatarType type;
  final String? imageUrl;
  final String? initials;
  final IconData? icon;
  final bool isOnline;
  final bool isDisabled;
}

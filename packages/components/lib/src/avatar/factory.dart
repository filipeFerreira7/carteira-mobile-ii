import 'package:flutter/material.dart';
import 'avatar.dart';
import 'model.dart';

class AvatarFactory {
  static Avatar image({
    required String url,
    AvatarSize size = AvatarSize.medium,
    bool isOnline = false,
    bool isDisabled = false,
  }) {
    return Avatar(
      viewModel: AvatarViewModel(
        type: AvatarType.image,
        imageUrl: url,
        size: size,
        isOnline: isOnline,
        isDisabled: isDisabled,
      ),
    );
  }

  static Avatar initials({
    required String initials,
    AvatarSize size = AvatarSize.medium,
    bool isOnline = false,
    bool isDisabled = false,
  }) {
    return Avatar(
      viewModel: AvatarViewModel(
        type: AvatarType.initials,
        initials: initials,
        size: size,
        isOnline: isOnline,
        isDisabled: isDisabled,
      ),
    );
  }

  static Avatar icon({
    required IconData icon,
    AvatarSize size = AvatarSize.medium,
    bool isOnline = false,
    bool isDisabled = false,
  }) {
    return Avatar(
      viewModel: AvatarViewModel(
        type: AvatarType.icon,
        icon: icon,
        size: size,
        isOnline: isOnline,
        isDisabled: isDisabled,
      ),
    );
  }
}

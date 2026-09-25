import 'package:flutter/material.dart';

enum ListItemState {
  defaultState,
  hover,
  focus,
  selected,
  disabled,
}

class ListItemViewModel {

  const ListItemViewModel({
    required this.label,
    this.details,
    this.leading,
    this.trailing,
    this.state = ListItemState.defaultState,
    this.isEnabled = true,
    this.onTap,
  });
  final String label;
  final String? details;
  final Widget? leading;
  final Widget? trailing;
  final ListItemState state;
  final bool isEnabled;
  final VoidCallback? onTap;

  ListItemViewModel copyWith({
    String? label,
    String? details,
    Widget? leading,
    Widget? trailing,
    ListItemState? state,
    bool? isEnabled,
    VoidCallback? onTap,
  }) {
    return ListItemViewModel(
      label: label ?? this.label,
      details: details ?? this.details,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
      state: state ?? this.state,
      isEnabled: isEnabled ?? this.isEnabled,
      onTap: onTap ?? this.onTap,
    );
  }
}

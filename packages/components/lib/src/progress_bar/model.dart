import 'package:flutter/foundation.dart';

enum ProgressBarState {
  defaultState,
  hover,
  focus,
  active,
  disabled,
}

enum LabelPosition {
  left,
  right,
  none,
}

class ProgressBarViewModel {

  const ProgressBarViewModel({
    required this.value,
    this.labelPosition = LabelPosition.none,
    this.state = ProgressBarState.defaultState,
    this.isEnabled = true,
    this.onChanged,
  });
  final double value; // 0.0 to 1.0
  final LabelPosition labelPosition;
  final ProgressBarState state;
  final bool isEnabled;
  final ValueChanged<double>? onChanged;

  ProgressBarViewModel copyWith({
    double? value,
    LabelPosition? labelPosition,
    ProgressBarState? state,
    bool? isEnabled,
    ValueChanged<double>? onChanged,
  }) {
    return ProgressBarViewModel(
      value: value ?? this.value,
      labelPosition: labelPosition ?? this.labelPosition,
      state: state ?? this.state,
      isEnabled: isEnabled ?? this.isEnabled,
      onChanged: onChanged ?? this.onChanged,
    );
  }
}

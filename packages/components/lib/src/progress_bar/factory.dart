import 'package:flutter/material.dart';
import 'model.dart';
import 'progress_bar.dart';

class ProgressBarFactory {
  static Widget linear({
    required double value,
    LabelPosition labelPosition = LabelPosition.none,
    ProgressBarState state = ProgressBarState.defaultState,
    bool isEnabled = true,
  }) {
    return ProgressBar(
      viewModel: ProgressBarViewModel(
        value: value,
        labelPosition: labelPosition,
        state: state,
        isEnabled: isEnabled,
      ),
    );
  }

  static Widget linearWithLeftLabel({
    required double value,
    bool isEnabled = true,
  }) {
    return linear(
      value: value,
      labelPosition: LabelPosition.left,
      isEnabled: isEnabled,
    );
  }

  static Widget linearWithRightLabel({
    required double value,
    bool isEnabled = true,
  }) {
    return linear(
      value: value,
      labelPosition: LabelPosition.right,
      isEnabled: isEnabled,
    );
  }

  static Widget disabled({
    required double value,
  }) {
    return linear(
      value: value,
      isEnabled: false,
      state: ProgressBarState.disabled,
    );
  }
}

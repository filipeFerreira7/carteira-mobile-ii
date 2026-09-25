import 'package:flutter/material.dart';
import 'loading_component.dart';
import 'loading_view_model.dart';

/// Factory do Loading.
class LoadingFactory {
  static Widget create({
    LoadingSize size = LoadingSize.md,
    String? message,
  }) {
    final viewModel = LoadingViewModel(size: size, message: message);
    return LoadingComponent(viewModel: viewModel);
  }
}

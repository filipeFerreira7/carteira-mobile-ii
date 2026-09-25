import 'package:flutter/material.dart';
import 'tab_bar.dart';
import 'tab_bar_view_model.dart';
import 'tab_view_model.dart';

class TabBarFactory {
  static Widget standard({
    required List<TabViewModel> tabs,
    int selectedIndex = 0,
    ValueChanged<int>? onTabChanged,
  }) {
    return AppTabBar(
      viewModel: TabBarViewModel(
        tabs: tabs,
        selectedIndex: selectedIndex,
        onTabChanged: onTabChanged,
      ),
    );
  }
}

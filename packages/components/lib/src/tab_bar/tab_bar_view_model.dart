import 'package:flutter/foundation.dart';
import 'tab_view_model.dart';

class TabBarViewModel {

  const TabBarViewModel({
    required this.tabs,
    this.selectedIndex = 0,
    this.onTabChanged,
  });
  final List<TabViewModel> tabs;
  final int selectedIndex;
  final ValueChanged<int>? onTabChanged;

  TabBarViewModel copyWith({
    List<TabViewModel>? tabs,
    int? selectedIndex,
    ValueChanged<int>? onTabChanged,
  }) {
    return TabBarViewModel(
      tabs: tabs ?? this.tabs,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      onTabChanged: onTabChanged ?? this.onTabChanged,
    );
  }

  bool isTabEnabled(int index) {
    if (index < 0 || index >= tabs.length) return false;
    return tabs[index].isEnabled;
  }
}

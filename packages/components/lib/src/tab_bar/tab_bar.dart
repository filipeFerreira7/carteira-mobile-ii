import 'package:flutter/material.dart';
import '../../common/theme/app_spacing.dart';
import 'tab.dart';
import 'tab_bar_view_model.dart';
import 'tab_view_model.dart';

class AppTabBar extends StatelessWidget {

  const AppTabBar({
    super.key,
    required this.viewModel,
  });
  final TabBarViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(viewModel.tabs.length, (index) {
          final tabViewModel = viewModel.tabs[index];
          final isSelected = index == viewModel.selectedIndex;
          
          return Padding(
            padding: EdgeInsets.only(
              right: index == viewModel.tabs.length - 1 ? 0 : AppSpacing.sm,
            ),
            child: AppTab(
              viewModel: tabViewModel.copyWith(
                state: isSelected ? TabState.selected : tabViewModel.state,
                onTap: () {
                  if (tabViewModel.isEnabled) {
                    viewModel.onTabChanged?.call(index);
                    tabViewModel.onTap?.call();
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

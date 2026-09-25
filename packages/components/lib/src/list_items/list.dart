import 'package:flutter/material.dart';
import '../../common/theme/app_spacing.dart';
import 'list_items.dart';
import 'model.dart';

class AppList extends StatelessWidget {

  const AppList({
    super.key,
    required this.items,
    this.selectedIndex,
    this.onItemSelected,
  });
  final List<ListItemViewModel> items;
  final int? selectedIndex;
  final ValueChanged<int>? onItemSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.xs),
      itemBuilder: (context, index) {
        final item = items[index];
        final isSelected = selectedIndex == index;

        return ListItem(
          viewModel: item.copyWith(
            state: isSelected ? ListItemState.selected : item.state,
            onTap: () {
              if (item.isEnabled) {
                onItemSelected?.call(index);
                item.onTap?.call();
              }
            },
          ),
        );
      },
    );
  }
}

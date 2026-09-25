import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import 'list_items.dart';
import 'model.dart';

class ListItemsFactory {
  static Widget standard({
    required String label,
    String? details,
    Widget? leading,
    Widget? trailing,
    ListItemState state = ListItemState.defaultState,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return ListItem(
      viewModel: ListItemViewModel(
        label: label,
        details: details,
        leading: leading,
        trailing: trailing,
        state: state,
        isEnabled: isEnabled,
        onTap: onTap,
      ),
    );
  }

  static Widget withAvatar({
    required String label,
    required String initial,
    String? details,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return standard(
      label: label,
      details: details,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.primary,
        child: Text(
          initial,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  static Widget withChevron({
    required String label,
    String? details,
    Widget? leading,
    VoidCallback? onTap,
  }) {
    return standard(
      label: label,
      details: details,
      leading: leading,
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }

  static Widget withDetails({
    required String label,
    required String details,
    Widget? leading,
    VoidCallback? onTap,
  }) {
    return standard(
      label: label,
      leading: leading,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(details, style: const TextStyle(color: AppColors.primary, fontSize: 14)),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 16, color: AppColors.primary),
        ],
      ),
      onTap: onTap,
    );
  }

  static Widget withToggle({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    Widget? leading,
  }) {
    return standard(
      label: label,
      leading: leading,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppColors.primary,
      ),
      onTap: () => onChanged(!value),
    );
  }

  static Widget withCheckbox({
    required String label,
    required bool value,
    required ValueChanged<bool?> onChanged,
    Widget? leading,
  }) {
    return standard(
      label: label,
      leading: leading,
      trailing: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onTap: () => onChanged(!value),
    );
  }

  static Widget withRadio<T>({
    required String label,
    required T value,
    required T groupValue,
    required ValueChanged<T?> onChanged,
    Widget? leading,
  }) {
    return standard(
      label: label,
      leading: leading,
      trailing: RadioGroup<T>(
        groupValue: groupValue,
        onChanged: onChanged,
        child: Radio<T>(
          value: value,
          activeColor: AppColors.primary,
        ),
      ),
      onTap: () => onChanged(value),
    );
  }

  static Widget withStepper({
    required String label,
    required int value,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
    Widget? leading,
  }) {
    return standard(
      label: label,
      leading: leading,
      trailing: Container(
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove, size: 16, color: AppColors.primary),
              onPressed: onDecrement,
            ),
            Text(
              '$value',
              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            IconButton(
              icon: const Icon(Icons.add, size: 16, color: AppColors.primary),
              onPressed: onIncrement,
            ),
          ],
        ),
      ),
    );
  }
}

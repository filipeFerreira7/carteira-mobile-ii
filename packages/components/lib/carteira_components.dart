/// Carteira UI component library.
///
/// Twelve components, each one following the same three-file shape:
/// `model.dart` (the ViewModel), the widget itself, and a `Factory` that is the
/// single entry point for callers.
library;

export 'common/theme/app_colors.dart';
export 'common/theme/app_dimensions.dart';
export 'common/theme/app_spacing.dart';
export 'common/theme/app_theme.dart';
export 'common/theme/app_typography.dart';
export 'common/viewmodel/base_view_model.dart';

export 'src/action_button/action_button_component.dart';
export 'src/action_button/action_button_factory.dart';
export 'src/action_button/action_button_view_model.dart';

export 'src/avatar/avatar.dart';
export 'src/avatar/factory.dart';
export 'src/avatar/model.dart';

export 'src/badge/badge.dart';
export 'src/badge/factory.dart';
export 'src/badge/model.dart';

export 'src/card/card.dart';
export 'src/card/factory.dart';
export 'src/card/model.dart';

export 'src/chip/chip.dart';
export 'src/chip/factory.dart';
export 'src/chip/model.dart';

export 'src/context_menu/context_menu.dart';
export 'src/context_menu/factory.dart';
export 'src/context_menu/item.dart';
export 'src/context_menu/list.dart';
export 'src/context_menu/model.dart';

export 'src/list_items/factory.dart';
export 'src/list_items/list.dart';
export 'src/list_items/list_items.dart';
export 'src/list_items/model.dart';

export 'src/loading/loading_component.dart';
export 'src/loading/loading_factory.dart';
export 'src/loading/loading_view_model.dart';

export 'src/progress_bar/factory.dart';
export 'src/progress_bar/model.dart';
export 'src/progress_bar/progress_bar.dart';

export 'src/snackbar/factory.dart';
export 'src/snackbar/model.dart';
export 'src/snackbar/snackbar.dart';

export 'src/tab_bar/tab.dart';
export 'src/tab_bar/tab_bar.dart';
export 'src/tab_bar/tab_bar_factory.dart';
export 'src/tab_bar/tab_bar_view_model.dart';
export 'src/tab_bar/tab_factory.dart';
export 'src/tab_bar/tab_view_model.dart';

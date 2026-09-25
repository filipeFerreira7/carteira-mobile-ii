import 'model.dart';
import 'card.dart';

class CardFactory {
  static AppCard vertical({
    String? imageUrl,
    required String title,
    required String description,
    List<CardAction> actions = const [],
  }) {
    return AppCard(
      viewModel: CardViewModel(
        imageUrl: imageUrl,
        title: title,
        description: description,
        actions: actions,
        layout: CardLayout.vertical,
      ),
    );
  }

  static AppCard horizontal({
    String? imageUrl,
    required String title,
    required String description,
    List<CardAction> actions = const [],
  }) {
    return AppCard(
      viewModel: CardViewModel(
        imageUrl: imageUrl,
        title: title,
        description: description,
        actions: actions,
        layout: CardLayout.horizontal,
      ),
    );
  }
}

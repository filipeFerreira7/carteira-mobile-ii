import 'package:flutter/foundation.dart';

/// Base class of every component ViewModel.
///
/// It is a [ChangeNotifier], so a ViewModel can be handed straight to a
/// `ListenableBuilder`. [notify] is the method subclasses call after mutating
/// their own fields; it is a no-op once the ViewModel has been disposed, which
/// keeps late async callbacks from throwing.
abstract class BaseViewModel extends ChangeNotifier {
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  /// Tells the widget tree that the state of this ViewModel changed.
  void notify() {
    if (_isDisposed) return;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}

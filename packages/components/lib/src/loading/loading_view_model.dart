import '../../common/viewmodel/base_view_model.dart';

/// 5 tamanhos conforme Figma (Loader-1.png): xxl até xs.
enum LoadingSize { xxl, xl, lg, md, sm }

/// ViewModel do componente Loading.
/// Define tamanho, cor e espessura do CircularProgressIndicator.
class LoadingViewModel extends BaseViewModel {
  LoadingViewModel({
    this.size = LoadingSize.md,
    this.color,
    this.message,
  });

  final LoadingSize size;
  final String? color;
  final String? message;

  double get diameter {
    switch (size) {
      case LoadingSize.xxl:
        return 64;
      case LoadingSize.xl:
        return 48;
      case LoadingSize.lg:
        return 36;
      case LoadingSize.md:
        return 28;
      case LoadingSize.sm:
        return 20;
    }
  }

  double get strokeWidth {
    switch (size) {
      case LoadingSize.xxl:
        return 5;
      case LoadingSize.xl:
        return 4;
      case LoadingSize.lg:
        return 3.5;
      case LoadingSize.md:
        return 3;
      case LoadingSize.sm:
        return 2.5;
    }
  }
}

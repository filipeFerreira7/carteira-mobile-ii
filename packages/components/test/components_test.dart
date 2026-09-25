import 'package:carteira_components/carteira_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Wraps [child] in the theme the components were designed against.
Widget _host(Widget child) => MaterialApp(
  theme: AppTheme.light(),
  home: Scaffold(body: Center(child: child)),
);

void main() {
  group('Factories build every component', () {
    testWidgets('ActionButton', (tester) async {
      var taps = 0;
      final viewModel = ActionButtonViewModel(
        label: 'Salvar',
        onTap: () => taps++,
      );
      addTearDown(viewModel.dispose);

      await tester.pumpWidget(_host(ActionButtonComponent(viewModel: viewModel)));
      expect(find.text('Salvar'), findsOneWidget);

      await tester.tap(find.text('Salvar'));
      await tester.pumpAndSettle();
      expect(taps, 1);
    });

    testWidgets('Avatar', (tester) async {
      await tester.pumpWidget(
        _host(AvatarFactory.initials(initials: 'AC')),
      );
      expect(find.text('AC'), findsOneWidget);
    });

    testWidgets('Badge', (tester) async {
      await tester.pumpWidget(
        _host(BadgeFactory.solid('Novo', color: BadgeColor.success)),
      );
      expect(find.text('Novo'), findsOneWidget);
    });

    testWidgets('Card', (tester) async {
      await tester.pumpWidget(
        _host(
          CardFactory.vertical(
            title: 'Poupança',
            description: 'Reserva de emergência',
          ),
        ),
      );
      expect(find.text('Poupança'), findsOneWidget);
      expect(find.text('Reserva de emergência'), findsOneWidget);
    });

    testWidgets('Chip', (tester) async {
      await tester.pumpWidget(_host(ChipFactory.solid('Mercado')));
      expect(find.text('Mercado'), findsOneWidget);
    });

    testWidgets('ContextMenu', (tester) async {
      await tester.pumpWidget(
        _host(
          ContextMenuFactory.simple(
            trigger: const Text('Abrir'),
            items: [ContextMenuFactory.item(label: 'Editar')],
          ),
        ),
      );
      expect(find.text('Abrir'), findsOneWidget);
    });

    testWidgets('ContextMenuList renders its rows', (tester) async {
      await tester.pumpWidget(
        _host(
          ContextMenuList(
            items: [
              ContextMenuFactory.item(label: 'Editar'),
              ContextMenuFactory.destructive(label: 'Excluir'),
            ],
          ),
        ),
      );
      expect(find.text('Editar'), findsOneWidget);
      expect(find.text('Excluir'), findsOneWidget);
    });

    testWidgets('ListItems', (tester) async {
      await tester.pumpWidget(
        _host(
          ListItemsFactory.standard(label: 'Conta corrente'),
        ),
      );
      expect(find.text('Conta corrente'), findsOneWidget);
    });

    testWidgets('Loading', (tester) async {
      await tester.pumpWidget(
        _host(LoadingFactory.create(message: 'Carregando...')),
      );
      expect(find.text('Carregando...'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('ProgressBar', (tester) async {
      await tester.pumpWidget(
        _host(
          ProgressBarFactory.linearWithRightLabel(value: 0.5),
        ),
      );
      expect(find.text('50%'), findsOneWidget);
    });

    testWidgets('SnackBar', (tester) async {
      await tester.pumpWidget(
        _host(
          SnackBarFactory.success(
            title: 'Transferência feita',
            description: 'Ana -> Bruno',
          ),
        ),
      );
      expect(find.text('Transferência feita'), findsOneWidget);
      expect(find.text('Ana -> Bruno'), findsOneWidget);
    });

    testWidgets('TabBar', (tester) async {
      await tester.pumpWidget(
        _host(
          TabBarFactory.standard(
            tabs: const [
              TabViewModel(label: 'Extrato'),
              TabViewModel(label: 'Cartões'),
            ],
          ),
        ),
      );
      expect(find.text('Extrato'), findsOneWidget);
      expect(find.text('Cartões'), findsOneWidget);
    });
  });
}

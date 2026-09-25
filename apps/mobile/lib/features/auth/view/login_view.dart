import 'package:carteira_components/carteira_components.dart' hide AppSpacing;
import 'package:carteira_design_system/carteira_design_system.dart'
    hide
        BadgeFactory,
        BadgeColor,
        BadgeSize,
        BadgeStyle;
import 'package:flutter/material.dart';

import '../../../l10n/strings.dart';

/// Static login screen: only layout, no state, no behavior yet.
///
/// Read it from the outside in: a [Scaffold] gives the page its background
/// and safe areas; a [ListView] lets the content scroll when the keyboard
/// shows up; the children stack vertically with explicit spacing.
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screen,
            vertical: AppSpacing.md,
          ),
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ContextMenuFactory.simple(
                trigger: Icon(
                  Icons.info_outline,
                  size: 28,
                  color: theme.colorScheme.onSurface,
                ),
                items: [
                  ContextMenuFactory.item(
                    label: 'Suporte',
                    leadingIcon: Icons.help_outline,
                  ),
                  ContextMenuFactory.item(
                    label: 'Sobre o App',
                    leadingIcon: Icons.info_outline,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Center(
              child: Icon(
                Icons.account_balance_wallet_rounded,
                size: 56,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Center(
              child: BadgeFactory.solid(
                'NOVA VERSÃO',
                color: BadgeColor.success,
                size: BadgeSize.small,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              Strings.appName,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              Strings.loginSubtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: context.semanticColors.muted,
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            const TextField(
              decoration: InputDecoration(
                labelText: Strings.email,
                prefixIcon: Icon(Icons.mail_outline),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.lg),
            const TextField(
              decoration: InputDecoration(
                labelText: Strings.password,
                prefixIcon: Icon(Icons.lock_outline),
              ),
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.xl),
            ActionButtonFactory.create(
              label: Strings.signIn,
              variant: ActionButtonVariant.primary,
              size: ActionButtonSize.medium,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

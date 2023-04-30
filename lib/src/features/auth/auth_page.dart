import 'package:bitsgap_test/resources/assets.gen.dart';
import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/features/auth/domain/auth_page_store.dart';
import 'package:bitsgap_test/src/uikit/app_animated_toggle.dart';
import 'package:bitsgap_test/src/uikit/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AuthPage extends StatelessWidget {
  final AuthPageStore store;

  const AuthPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: Assets.icons.logo.svg(),
            ),
            Expanded(
              child: PageView(
                controller: store.authPageController,
                physics: const NeverScrollableScrollPhysics(),
                children: store.pages.map((e) => e.build(store)).toList(),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Observer(
                      builder: (context) {
                        return AppAnimatedToggle(
                          onTap: (value) => store.currentPage = value,
                          height: 40,
                          values: store.pages,
                          labels: store.pages.map((e) => e.label).toList(),
                          selectedIndex: store.pageIndex,
                        );
                      },
                    ),
                    const SizedBox(height: 42),
                    TextButton(
                      onPressed: store.forgotPassword,
                      child: Text(AppL10n.of(context).buttonForgot),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

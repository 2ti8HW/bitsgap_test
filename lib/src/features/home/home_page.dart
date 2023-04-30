import 'package:bitsgap_test/resources/l10n/generated/l10n.dart';
import 'package:bitsgap_test/src/features/home/domain/home_page_store.dart';
import 'package:bitsgap_test/src/uikit/app_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomePageStore store;

  const HomePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(AppL10n.of(context).welcome(store.userName)),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: store.signOut,
                    child: Text(AppL10n.of(context).buttonSignOut),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:breakfree/configs/themes/app_theme.dart';
import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/widgets/appbar.dart';
import 'package:breakfree/widgets/button.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BreakfreeAppBar(
        showBackButton: false,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.paddingMedium,
            vertical: AppTheme.paddingMedium),
        child: BreakfreeButton(
          label: 'Continuer',
          onPressed: () async {
            context.navigator.pushNamed('/auth/setup');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bienvenue sur pepper",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacing.medium(),
            Text(
              'Nous allons enssemble paramétrer ton profil, pour que tu puisses profiter pleinement de l\'application',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacing.xlarge(),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/illustrations/hello.png',
                  fit: BoxFit.contain,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

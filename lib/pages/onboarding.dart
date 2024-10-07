import 'package:breakfree/configs/themes/app_theme.dart';
import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/widgets/appbar.dart';
import 'package:breakfree/widgets/button.dart';
import 'package:breakfree/widgets/icon_button.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _page = 1;
  final PageController _pageController = PageController();

  final textes = [
    {
      'title': 'Bienvenue sur BreakFree',
      'subtitle':
          "L'application qui vous aide à lutter contre les addictions et à retrouver votre liberté.",
      'image': 'assets/images/illustrations/onboarding1.png',
    },
    {
      'title': 'Votre bien-être est notre priorité',
      'subtitle':
          "Nous vous accompagnons dans votre démarche de sevrage et vous aidons à retrouver votre liberté.",
      'image': 'assets/images/illustrations/onboarding2.png',
    },
    {
      'title': 'Commencez dès maintenant',
      'subtitle':
          "Créez votre compte et commencez à utiliser l'application pour retrouver votre liberté.",
      'image': 'assets/images/illustrations/onboarding3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BreakfreeAppBar(
        showBackButton: false,
        isTransparent: true,
        leading: _page == 1
            ? null
            : IconButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                icon: const Icon(LucideIcons.arrow_left),
              ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _page = value + 1;
                });
              },
              children: [
                for (int i = 1; i <= textes.length; i++)
                  Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.paddingExtraLarge,
                          ),
                          child: Image.asset(
                            textes[i - 1]['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.paddingMedium,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacing.large(),
                              Text(
                                textes[i - 1]['title'] ?? '',
                                style:
                                    context.textTheme.headlineLarge!.copyWith(
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                              const Spacing.small(),
                              Text(
                                textes[i - 1]['subtitle'] ?? '',
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: context.colorScheme.outline,
                                ),
                              ),
                              const Spacing.large(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.paddingMedium,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: textes.length,
                    effect: ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      expansionFactor: 6,
                      activeDotColor: context.colorScheme.primary,
                      dotColor: context.colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                ),
                const Spacing.xlarge(),
                Row(
                  children: [
                    BreakfreeIconButton(
                      icon: LucideIcons.arrow_right_to_line,
                      onPressed: () async {
                        context.navigator.pushNamed('/auth/register');
                      },
                    ),
                    const Spacing.medium(),
                    Expanded(
                      child: BreakfreeButton(
                        label: _page == 3 ? 'Commencer' : 'Suivant',
                        onPressed: () async {
                          if (_page == 3) {
                            context.navigator.pushNamed('/auth/register');
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

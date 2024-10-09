import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems = const [
  BottomNavigationBarItem(
    icon: Icon(LucideIcons.house),
    activeIcon: Icon(LucideIcons.house),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(LucideIcons.message_circle),
    activeIcon: Icon(LucideIcons.message_circle),
    label: 'Forum',
  ),
  BottomNavigationBarItem(
    icon: Icon(LucideIcons.newspaper),
    activeIcon: Icon(LucideIcons.newspaper),
    label: 'Article',
  ),
  BottomNavigationBarItem(
    icon: Icon(LucideIcons.user),
    activeIcon: Icon(LucideIcons.user),
    label: 'Profile',
  ),
];

class BreakFreeNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BreakFreeNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> navigationDestinations = [
      NavigationDestination(
        icon: const Icon(LucideIcons.house),
        selectedIcon: Icon(
          LucideIcons.house,
          color: context.colorScheme.onPrimary,
        ),
        label: 'Home',
      ),
      NavigationDestination(
        icon: const Icon(LucideIcons.message_circle),
        selectedIcon: Icon(
          LucideIcons.message_circle,
          color: context.colorScheme.onPrimary,
        ),
        label: 'Forum',
      ),
      NavigationDestination(
        icon: const Icon(LucideIcons.newspaper),
        selectedIcon: Icon(
          LucideIcons.newspaper,
          color: context.colorScheme.onPrimary,
        ),
        label: 'Article',
      ),
      NavigationDestination(
        icon: const Icon(LucideIcons.user),
        selectedIcon: Icon(
          LucideIcons.user,
          color: context.colorScheme.onPrimary,
        ),
        label: 'Profile',
      ),
    ];

    return isIOS
        ? CupertinoTabBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: bottomNavigationBarItems,
          )
        : NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            onDestinationSelected: onTap,
            height: 70,
            elevation: 0,
            destinations: navigationDestinations,
            selectedIndex: currentIndex,
            indicatorColor: context.colorScheme.primary,
          );
  }
}

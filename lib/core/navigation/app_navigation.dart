import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janazty/core/constants/app_strings.dart';

import '../../features/funeral/presentation/screens/add_funeral_screen.dart';
import '../../features/funeral/presentation/screens/home_screen.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_nav_item.dart';
import 'app_navigation_provider.dart';

class AppNavigation extends ConsumerWidget {
  const AppNavigation({super.key});

  static final List<Widget> _screens = [
    const HomeScreen(),
    const AddFuneralScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(appNavigationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.accent,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.accent,
        iconTheme: const IconThemeData(color: AppColors.accent),
      ),
      drawer: const CustomDrawer(),
      body: _screens[selectedIndex],
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.primary),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomNavItem(
                  icon: Icons.mosque,
                  label: AppStrings.todayJanazah,
                  index: 0,
                  isSelected: selectedIndex == 0,
                  onTap: () =>
                      ref.read(appNavigationProvider.notifier).setIndex(0),
                ),
                CustomNavItem(
                  icon: Icons.add_circle,
                  label: AppStrings.addJanazah,
                  index: 1,
                  isSelected: selectedIndex == 1,
                  onTap: () =>
                      ref.read(appNavigationProvider.notifier).setIndex(1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

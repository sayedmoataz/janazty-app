import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janazty/core/constants/app_colors.dart';
import 'package:janazty/core/constants/app_strings.dart';

import '../../features/funeral/presentation/screens/prayer_guide_screen.dart';
import '../../features/funeral/presentation/screens/services_directory_screen.dart';
import '../navigation/app_navigation_provider.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.mosque, size: 64, color: AppColors.white),
                const SizedBox(height: 12),
                const Text(
                  AppStrings.appName,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  AppStrings.appDescription,
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.9),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.mosque, color: AppColors.primary),
            title: const Text('الجنازات'),
            onTap: () {
              Navigator.pop(context);
              ref.read(appNavigationProvider.notifier).setIndex(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle, color: AppColors.primary),
            title: const Text('إضافة جنازة'),
            onTap: () {
              Navigator.pop(context);
              ref.read(appNavigationProvider.notifier).setIndex(1);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.business, color: AppColors.primary),
            title: const Text('دليل الخدمات'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServicesDirectoryScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book, color: AppColors.primary),
            title: const Text('صفة الصلاة والأدعية'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrayerGuideScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.primary),
            title: const Text('عن التطبيق'),
            onTap: () {
              Navigator.pop(context);
              _showAboutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'جنازتي',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.mosque,
        size: 48,
        color: AppColors.primary,
      ),
      children: [
        const Text(
          'تطبيق إسلامي خيري مجاني 100% يساعد المسلمين على معرفة مواعيد وأماكن صلاة الجنازة.',
        ),
        const SizedBox(height: 16),
        const Text(
          'صدقة جارية مفتوحة المصدر',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

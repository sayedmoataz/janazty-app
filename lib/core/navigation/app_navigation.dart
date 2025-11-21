import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/funeral/presentation/screens/about_app_screen.dart';
import '../../features/funeral/presentation/screens/add_funeral_screen.dart';
import '../../features/funeral/presentation/screens/home_screen.dart';
import '../../features/funeral/presentation/screens/prayer_guide_screen.dart';
import '../../features/funeral/presentation/screens/services_directory_screen.dart';
import '../constants/app_colors.dart';

class AppNavigation extends ConsumerStatefulWidget {
  const AppNavigation({super.key});

  @override
  ConsumerState<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends ConsumerState<AppNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [HomeScreen(), AddFuneralScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mosque, size: 64, color: AppColors.accent),
                  SizedBox(height: 8),
                  Text(
                    'جنازتي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: AppColors.primary),
              title: const Text('الجنازات'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
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
              leading: const Icon(Icons.info, color: AppColors.primary),
              title: const Text('عن التطبيق'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutAppScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.email, color: AppColors.primary),
              title: const Text('تواصل معنا'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('info@janazty.app')),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الجنازات'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'إضافة'),
        ],
      ),
    );
  }
}

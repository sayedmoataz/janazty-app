import 'package:flutter/material.dart';

import '../../features/funeral/presentation/screens/add_funeral_screen.dart';
import '../../features/funeral/presentation/screens/home_screen.dart';
import '../../features/funeral/presentation/screens/prayer_guide_screen.dart';
import '../../features/funeral/presentation/screens/services_directory_screen.dart';
import '../constants/app_colors.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [const HomeScreen(), const AddFuneralScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جنازتي'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      drawer: _buildDrawer(context),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.mosque), label: 'الجنازات'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'إضافة'),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.mosque, size: 64, color: Colors.white),
                const SizedBox(height: 12),
                const Text(
                  'جنازتي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'كل ما تحتاجه لتكون من المصلّين',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
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
              setState(() {
                _selectedIndex = 0;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle, color: AppColors.primary),
            title: const Text('إضافة جنازة'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _selectedIndex = 1;
              });
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

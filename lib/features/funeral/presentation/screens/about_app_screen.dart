import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عن التطبيق'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.mosque, size: 80, color: AppColors.accent),
            const SizedBox(height: 16),
            const Text(
              AppStrings.appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'الإصدار 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 32),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عن التطبيق',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'تطبيق جنازتي هو تطبيق إسلامي يهدف إلى مساعدة المسلمين في معرفة مواعيد صلاة الجنازة في المساجد القريبة منهم، وتوفير دليل شامل للخدمات الجنائزية.',
                      style: TextStyle(fontSize: 14, height: 1.6),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'هذا التطبيق صدقة جارية لكل من ساهم في تطويره ونشره. نسأل الله أن يتقبله منا ومنكم.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'المميزات',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildFeatureItem('إعلانات الجنازات اليومية'),
                    _buildFeatureItem('دليل الخدمات الجنائزية'),
                    _buildFeatureItem('صفة صلاة الجنازة والأدعية'),
                    _buildFeatureItem('مشاركة الإعلانات عبر واتساب وتليجرام'),
                    _buildFeatureItem('بدون إعلانات أو تتبع'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'تواصل معنا',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      leading: const Icon(Icons.email, color: AppColors.info),
                      title: const Text('البريد الإلكتروني'),
                      subtitle: const Text('info@janazty.app'),
                      onTap: () async {
                        final url = Uri.parse('mailto:info@janazty.app');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.language,
                        color: AppColors.info,
                      ),
                      title: const Text('الموقع الإلكتروني'),
                      subtitle: const Text('www.janazty.app'),
                      onTap: () async {
                        final url = Uri.parse('https://www.janazty.app');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement share app
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('شارك التطبيق مع أصدقائك')),
                );
              },
              icon: const Icon(Icons.share),
              label: const Text('شارك التطبيق'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '© 2025 جنازتي. جميع الحقوق محفوظة.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.textLight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.success, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

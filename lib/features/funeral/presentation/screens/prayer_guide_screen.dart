import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../providers/prayer_guide_provider.dart';
import '../widgets/prayer_guide_card.dart';

class PrayerGuideScreen extends ConsumerWidget {
  const PrayerGuideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prayerGuidesAsync = ref.watch(allPrayerGuidesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('صفة الصلاة والأدعية'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: prayerGuidesAsync.when(
        data: (guides) {
          if (guides.isEmpty) {
            return const Center(
              child: Text(
                'لا يوجد محتوى متاح حالياً',
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
              ),
            );
          }

          // Group by category
          final groupedGuides = <String, List>{};
          for (final guide in guides) {
            groupedGuides.putIfAbsent(guide.category, () => []).add(guide);
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: groupedGuides.length,
            itemBuilder: (context, index) {
              final category = groupedGuides.keys.elementAt(index);
              final categoryGuides = groupedGuides[category]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  ...categoryGuides.map((guide) {
                    return PrayerGuideCard(guide: guide);
                  }),
                  const SizedBox(height: 16),
                ],
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.accent),
        ),
        error: (_, __) => const Center(
          child: Text(
            'حدث خطأ في تحميل المحتوى',
            style: TextStyle(color: AppColors.error),
          ),
        ),
      ),
    );
  }
}

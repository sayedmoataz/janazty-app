import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entity/funeral_entity.dart';
import '../providers/funeral_notifier.dart';

class FuneralCard extends ConsumerWidget {
  final FuneralEntity funeral;

  const FuneralCard({required this.funeral, super.key});

  Future<void> _openInMaps(double lat, double lng) async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _shareFuneral(BuildContext context) {
    final deceasedName =
        funeral.deceasedName ?? 'فقيد عائلة ${funeral.mosqueName}';
    final date = DateFormat('EEEE d MMMM', 'ar').format(funeral.prayerTime);
    final time = DateFormat('h:mm a', 'ar').format(funeral.prayerTime);

    final message =
        '''
🕌 صلاة الجنازة

المتوفى: $deceasedName
المسجد: ${funeral.mosqueName}
الموعد: $date - $time

الموقع: https://www.google.com/maps/search/?api=1&query=${funeral.lat},${funeral.lng}

نسألكم الدعاء للميت
''';

    Share.share(message);
  }

  Future<void> _showReportDialog(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تبليغ عن تكرار'),
        content: const Text(
          'هل أنت متأكد أن هذه الجنازة مكررة؟\nبعد 3 بلاغات سيتم إخفاء الجنازة للمراجعة.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('تأكيد', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed ?? false) {
      await ref.read(funeralProvider.notifier).reportFuneral(funeral.id);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم إرسال البلاغ. شكرًا لمساعدتك في تحسين التطبيق'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deceasedName =
        funeral.deceasedName ?? 'فقيد عائلة ${funeral.mosqueName}';
    final date = DateFormat('EEEE d MMMM', 'ar').format(funeral.prayerTime);
    final time = DateFormat('h:mm a', 'ar').format(funeral.prayerTime);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Mosque Name + Verified Badge
            Row(
              children: [
                Expanded(
                  child: Text(
                    funeral.mosqueName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (funeral.isMosqueVerified)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.verified,
                          size: 16,
                          color: Colors.blue.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'موثق',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),

            // Deceased Name
            Text(deceasedName, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),

            // Date & Time
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  '$time - $date',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                // Prayed Button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await ref
                          .read(funeralProvider.notifier)
                          .incrementPrayCount(funeral.id);
                    },
                    icon: const Icon(Icons.check_circle_outline, size: 18),
                    label: Text('صلّيت عليه (${funeral.prayedCount})'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Map Button
                IconButton(
                  onPressed: () => _openInMaps(funeral.lat, funeral.lng),
                  icon: const Icon(Icons.map, color: AppColors.primary),
                  tooltip: 'افتح في الخريطة',
                ),

                // Share Button
                IconButton(
                  onPressed: () => _shareFuneral(context),
                  icon: const Icon(Icons.share, color: AppColors.primary),
                  tooltip: 'مشاركة',
                ),

                // Report Button
                IconButton(
                  onPressed: () => _showReportDialog(context, ref),
                  icon: const Icon(Icons.flag_outlined, color: Colors.grey),
                  tooltip: 'بلّغ عن تكرار',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

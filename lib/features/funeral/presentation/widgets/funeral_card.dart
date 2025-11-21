import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entity/funeral_entity.dart';
import '../providers/funeral_provider.dart';

class FuneralCard extends StatelessWidget {
  final FuneralEntity funeral;
  final WidgetRef ref;

  const FuneralCard({required this.funeral, required this.ref, super.key});

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('h:mm a').format(funeral.prayerTime);
    final date = DateFormat('EEEE d MMMM', 'ar').format(funeral.prayerTime);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.mosque, color: AppColors.primary),
                const SizedBox(width: 8),
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
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'موثق',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
            const Divider(height: 20),
            Text(
              'المتوفى: ${funeral.deceasedName}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text('الوقت: $time - $date', style: const TextStyle(fontSize: 16)),
            Text('المكان: ${funeral.mosqueLocation}'),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final url = Uri.parse(
                      'https://www.google.com/maps?q=${funeral.lat},${funeral.lng}',
                    );
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text('افتح في الخريطة'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.info,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () async {
                    await ref.read(prayCountProvider(funeral.id).future);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('جزاك الله خيراً! تم التسجيل'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.people, color: AppColors.accent),
                  label: Text(
                    '${funeral.prayedCount ?? 0} صلّوا',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

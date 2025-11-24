import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../services/storage/storage_service.dart';
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

    final StringBuffer sb = StringBuffer();

    sb.writeln('﴿ إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ ﴾ 🕊️');
    sb.writeln();
    sb.writeln(
      '🕌 تُقام صلاة الجنازة على '
      '${funeral.ageType == 'child'
          ? 'طفل 👶'
          : funeral.gender == 'male'
          ? 'رجل 👤'
          : 'امرأة 👩'}',
    );
    sb.writeln();
    sb.writeln('👤 اسم المتوفى: $deceasedName');
    sb.writeln('🏛️ المسجد: ${funeral.mosqueName}');
    sb.writeln('📅 الموعد: $date');
    sb.writeln('⏰ الوقت: $time');

    if (funeral.burialLocation != null && funeral.burialLocation!.isNotEmpty) {
      sb.writeln('⚰️ الدفن: ${funeral.burialLocation}');
    }

    if (funeral.funeralNotes != null && funeral.funeralNotes!.isNotEmpty) {
      sb.writeln('📝 ملاحظات الجنازة: ${funeral.funeralNotes}');
    }

    if (funeral.notes != null && funeral.notes!.isNotEmpty) {
      sb.writeln('📝 ملاحظات المتوفى: ${funeral.notes}');
    }

    sb.writeln();
    sb.writeln(
      '📍 موقع الجنازة على الخريطة:\n'
      'https://www.google.com/maps/search/?api=1&query=${funeral.lat},${funeral.lng}',
    );

    if (funeral.isMosqueVerified) {
      sb.writeln();
      sb.writeln('✔️ الإعلان نشر بواسطة المسجد');
    }

    sb.writeln();
    sb.writeln('🤲 نسألكم الدعاء للمتوفى وجزاكم الله خيراً');

    Share.share(sb.toString());
  }

  Future<void> _showReportDialog(BuildContext context, WidgetRef ref) async {
    // Check if user has already reported this funeral
    final hasReported = await sl<StorageService>().hasReportedFuneral(
      funeral.id,
    );

    if (hasReported) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('لقد قمت بالتبليغ عن هذه الجنازة مسبقاً'),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }

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
      // Save to local storage
      await sl<StorageService>().saveReportedFuneral(funeral.id);

      // Report to server
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
            const SizedBox(height: 12),

            // Additional Details
            if (funeral.burialLocation != null &&
                funeral.burialLocation!.isNotEmpty) ...[
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'الدفن: ${funeral.burialLocation}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],

            if (funeral.ageType != null) ...[
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'المتوفى: ${funeral.ageType == 'child' ? 'طفل' : 'بالغ'}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],

            if (funeral.funeralNotes != null &&
                funeral.funeralNotes!.isNotEmpty) ...[
              const SizedBox(height: 4),
              _ExpandableText(
                title: 'ملاحظات الجنازة:',
                text: funeral.funeralNotes!,
              ),
            ],

            if (funeral.notes != null && funeral.notes!.isNotEmpty) ...[
              const SizedBox(height: 4),
              _ExpandableText(title: 'ملاحظات المتوفى:', text: funeral.notes!),
            ],

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                // Prayed Button
                Expanded(
                  child: FutureBuilder<bool>(
                    future: sl<StorageService>().hasPrayedForFuneral(
                      funeral.id,
                    ),
                    builder: (context, snapshot) {
                      final hasPrayed = snapshot.data ?? false;
                      final isLoading =
                          snapshot.connectionState == ConnectionState.waiting;

                      return OutlinedButton.icon(
                        onPressed: (hasPrayed || isLoading)
                            ? null
                            : () async {
                                // Save to local storage
                                await sl<StorageService>().savePrayedFuneral(
                                  funeral.id,
                                );

                                // Increment count on server
                                await ref
                                    .read(funeralProvider.notifier)
                                    .incrementPrayCount(funeral.id);

                                // Rebuild the widget to show updated state
                                if (context.mounted) {
                                  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                  (context as Element).markNeedsBuild();
                                }
                              },
                        icon: Icon(
                          hasPrayed
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          size: 18,
                        ),
                        label: Text(
                          hasPrayed
                              ? 'صلّيت ✓ (${funeral.prayedCount})'
                              : 'صلّيت عليه (${funeral.prayedCount})',
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: hasPrayed
                              ? Colors.green
                              : AppColors.primary,
                          disabledForegroundColor: Colors.green.withOpacity(
                            0.7,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),

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

class _ExpandableText extends StatefulWidget {
  final String title;
  final String text;

  const _ExpandableText({required this.title, required this.text});

  @override
  State<_ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<_ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        LayoutBuilder(
          builder: (context, constraints) {
            final span = TextSpan(
              text: widget.text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            );
            final tp = TextPainter(
              text: span,
              maxLines: 1,
              textDirection: ui.TextDirection.rtl,
            );
            tp.layout(maxWidth: constraints.maxWidth);

            if (!tp.didExceedMaxLines) {
              return Text(widget.text, style: const TextStyle(fontSize: 14));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  maxLines: _isExpanded ? null : 1,
                  overflow: _isExpanded
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
                InkWell(
                  onTap: () => setState(() => _isExpanded = !_isExpanded),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      _isExpanded ? 'عرض أقل' : 'عرض المزيد',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

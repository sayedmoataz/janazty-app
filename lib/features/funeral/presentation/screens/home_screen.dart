import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janazty/core/constants/app_colors.dart';
import 'package:janazty/features/funeral/presentation/providers/funeral_provider.dart';

import '../widgets/funeral_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final funeralsAsync = ref.watch(funeralsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'جنازتي',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: funeralsAsync.when(
        data: (funerals) {
          if (funerals.isEmpty) {
            return const Center(
              child: Text(
                'لا توجد جنازات اليوم أو غداً\nالحمد لله على كل حال',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => ref.refresh(funeralsProvider),
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: funerals.length,
              itemBuilder: (context, index) {
                final funeral = funerals[index];
                return FuneralCard(funeral: funeral, ref: ref);
              },
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.accent),
        ),
        error: (_, _) => const Center(
          child: Text('حدث خطأ', style: TextStyle(color: AppColors.error)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // هنعمل شاشة الإضافة بعدين
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('شاشة إضافة جنازة - قريباً إن شاء الله'),
            ),
          );
        },
      ),
    );
  }
}

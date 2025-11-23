import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janazty/core/constants/app_colors.dart';
import 'package:janazty/features/funeral/presentation/providers/funeral_provider.dart';

import '../../../../core/navigation/app_navigation_provider.dart';
import '../widgets/empty_funeral_screen.dart';
import '../widgets/funeral_card.dart';
import '../widgets/funeral_error_screen.dart';
import '../widgets/funeral_loading_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final funeralsAsync = ref.watch(funeralsProvider);

    return Scaffold(
      body: funeralsAsync.when(
        data: (funerals) {
          if (funerals.isEmpty) {
            return const NoFuneralScreen();
          }

          return RefreshIndicator(
            onRefresh: () async => ref.refresh(funeralsProvider),
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: funerals.length,
              itemBuilder: (context, index) {
                final funeral = funerals[index];
                return FuneralCard(funeral: funeral);
              },
            ),
          );
        },
        loading: () => const FuneralLoadingScreen(),
        error: (_, _) => const FuneralErrorScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.add, color: AppColors.primary),
        onPressed: () {
          ref.read(appNavigationProvider.notifier).setIndex(1);
        },
      ),
    );
  }
}

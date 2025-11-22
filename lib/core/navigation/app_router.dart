import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/funeral/presentation/providers/funeral_provider.dart';
import '../../features/funeral/presentation/screens/funeral_detail_screen.dart';
import '../../features/funeral/presentation/screens/prayer_guide_screen.dart';
import '../../features/funeral/presentation/screens/services_directory_screen.dart';
import 'app_navigation.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const AppNavigation(),
      ),
      GoRoute(
        path: '/services',
        builder: (context, state) => const ServicesDirectoryScreen(),
      ),
      GoRoute(
        path: '/prayer-guide',
        builder: (context, state) => const PrayerGuideScreen(),
      ),
      GoRoute(
        path: '/funeral/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return Consumer(
            builder: (context, ref, child) {
              final funeralAsync = ref.watch(funeralByIdProvider(id));
              return funeralAsync.when(
                data: (funeral) => FuneralDetailScreen(funeral: funeral),
                loading: () => const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => Scaffold(
                  body: Center(child: Text('خطأ في تحميل البيانات: $error')),
                ),
              );
            },
          );
        },
      ),
    ],
  );
});

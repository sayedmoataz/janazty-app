import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entity/service_entity.dart';
import '../providers/service_provider.dart';
import '../widgets/service_card.dart';

class ServicesDirectoryScreen extends ConsumerStatefulWidget {
  const ServicesDirectoryScreen({super.key});

  @override
  ConsumerState<ServicesDirectoryScreen> createState() =>
      _ServicesDirectoryScreenState();
}

class _ServicesDirectoryScreenState
    extends ConsumerState<ServicesDirectoryScreen> {
  ServiceType? _selectedType;

  String _getServiceTypeLabel(ServiceType type) {
    switch (type) {
      case ServiceType.washer:
        return 'مغسلين موتى';
      case ServiceType.transport:
        return 'عربيات نقل موتى';
      case ServiceType.shroud:
        return 'أكفان صدقة';
      case ServiceType.cemetery:
        return 'مقابر صدقة';
    }
  }

  @override
  Widget build(BuildContext context) {
    final servicesAsync = _selectedType == null
        ? ref.watch(approvedServicesProvider)
        : ref.watch(servicesByTypeProvider(_selectedType!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('دليل الخدمات'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.surface,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'تصنيف الخدمات',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Text('الكل'),
                        selected: _selectedType == null,
                        onSelected: (selected) {
                          setState(() {
                            _selectedType = null;
                          });
                        },
                        selectedColor: AppColors.accent,
                        labelStyle: TextStyle(
                          color: _selectedType == null
                              ? Colors.white
                              : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ...ServiceType.values.map((type) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(_getServiceTypeLabel(type)),
                            selected: _selectedType == type,
                            onSelected: (selected) {
                              setState(() {
                                _selectedType = selected ? type : null;
                              });
                            },
                            selectedColor: AppColors.accent,
                            labelStyle: TextStyle(
                              color: _selectedType == type
                                  ? Colors.white
                                  : AppColors.textPrimary,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: servicesAsync.when(
              data: (services) {
                if (services.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox, size: 64, color: AppColors.textLight),
                        SizedBox(height: 16),
                        Text(
                          'لا توجد خدمات متاحة حالياً',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return ServiceCard(service: services[index]);
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.accent),
              ),
              error: (_, _) => const Center(
                child: Text(
                  'حدث خطأ في تحميل الخدمات',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to add service screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('شاشة اقتراح خدمة - قريباً إن شاء الله'),
            ),
          );
        },
        backgroundColor: AppColors.accent,
        icon: const Icon(Icons.add),
        label: const Text('اقترح خدمة'),
      ),
    );
  }
}

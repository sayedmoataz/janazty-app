import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../services/share/share_service.dart';
import '../../domain/entity/service_entity.dart';

class ServiceCard extends StatelessWidget {
  final ServiceEntity service;

  const ServiceCard({required this.service, super.key});

  String _getServiceTypeLabel(ServiceType type) {
    switch (type) {
      case ServiceType.washer:
        return 'مغسل موتى';
      case ServiceType.transport:
        return 'نقل موتى';
      case ServiceType.shroud:
        return 'أكفان';
      case ServiceType.cemetery:
        return 'مقبرة';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _getServiceTypeLabel(service.type),
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                if (service.isFree)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'مجاني',
                      style: TextStyle(
                        color: AppColors.success,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              service.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: AppColors.info),
                const SizedBox(width: 4),
                Text(
                  '${service.governorate} - ${service.area}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            if (service.details != null) ...[
              const SizedBox(height: 8),
              Text(
                service.details!,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ShareService.makePhoneCall(service.contactPhone);
                    },
                    icon: const Icon(Icons.phone, size: 18),
                    label: const Text('اتصل الآن'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    final message = ShareService.generateServiceShareMessage(
                      serviceName: service.title,
                      phone: service.contactPhone,
                      area: '${service.governorate} - ${service.area}',
                    );
                    ShareService.shareToWhatsApp(message);
                  },
                  icon: const Icon(Icons.share),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.surface,
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

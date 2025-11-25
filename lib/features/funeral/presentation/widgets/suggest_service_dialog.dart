import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entity/service_entity.dart';
import '../providers/service_provider.dart';

enum SuggestionMode { newServiceType, existingService }

class SuggestServiceDialog extends ConsumerStatefulWidget {
  const SuggestServiceDialog({super.key});

  @override
  ConsumerState<SuggestServiceDialog> createState() =>
      _SuggestServiceDialogState();
}

class _SuggestServiceDialogState extends ConsumerState<SuggestServiceDialog> {
  final _formKey = GlobalKey<FormState>();
  SuggestionMode _mode = SuggestionMode.existingService;

  // New Service Type fields
  final _serviceNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _exampleController = TextEditingController();

  // Existing Service fields
  ServiceType? _selectedType;
  final _titleController = TextEditingController();
  final _phoneController = TextEditingController();
  final _governorateController = TextEditingController();
  final _areaController = TextEditingController();
  final _detailsController = TextEditingController();
  bool _isFree = true;

  bool _isSubmitting = false;

  @override
  void dispose() {
    _serviceNameController.dispose();
    _descriptionController.dispose();
    _exampleController.dispose();
    _titleController.dispose();
    _phoneController.dispose();
    _governorateController.dispose();
    _areaController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

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

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      if (_mode == SuggestionMode.newServiceType) {
        // Submit new service type suggestion
        await ref.read(
          suggestNewServiceTypeProvider({
            'serviceName': _serviceNameController.text.trim(),
            'description': _descriptionController.text.trim(),
            'example': _exampleController.text.trim(),
          }).future,
        );

        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إرسال اقتراح نوع الخدمة بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        // Submit existing service suggestion
        final service = ServiceEntity(
          id: const Uuid().v4(),
          type: _selectedType!,
          title: _titleController.text.trim(),
          contactPhone: _phoneController.text.trim(),
          governorate: _governorateController.text.trim(),
          area: _areaController.text.trim(),
          isFree: _isFree,
          status: 'pending',
          createdAt: DateTime.now(),
          details: _detailsController.text.trim().isEmpty
              ? null
              : _detailsController.text.trim(),
        );

        await ref.read(suggestServiceProvider(service).future);

        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إرسال اقتراح الخدمة بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              const Text(
                'اقترح خدمة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Mode Selection
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: _ModeButton(
                        label: 'إضافة بيانات لخدمة موجودة',
                        isSelected: _mode == SuggestionMode.existingService,
                        onTap: () => setState(
                          () => _mode = SuggestionMode.existingService,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _ModeButton(
                        label: 'اقتراح نوع خدمة جديد',
                        isSelected: _mode == SuggestionMode.newServiceType,
                        onTap: () => setState(
                          () => _mode = SuggestionMode.newServiceType,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Form Fields
              Expanded(
                child: SingleChildScrollView(
                  child: _mode == SuggestionMode.newServiceType
                      ? _buildNewServiceTypeForm()
                      : _buildExistingServiceForm(),
                ),
              ),

              const SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      )
                    : const Text(
                        'إرسال الاقتراح',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewServiceTypeForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'اسم الخدمة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _serviceNameController,
          decoration: InputDecoration(
            hintText: 'مثال: خدمة تجهيز القبور',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'الرجاء إدخال اسم الخدمة';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'وصف الخدمة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _descriptionController,
          decoration: InputDecoration(
            hintText: 'اشرح ما هي هذه الخدمة وكيف تساعد الناس',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          maxLines: 3,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'الرجاء إدخال وصف الخدمة';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'مثال على الخدمة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _exampleController,
          decoration: InputDecoration(
            hintText: 'أعط مثالاً عملياً على كيفية تقديم هذه الخدمة',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          maxLines: 3,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'الرجاء إدخال مثال على الخدمة';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildExistingServiceForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'نوع الخدمة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<ServiceType>(
          value: _selectedType,
          decoration: InputDecoration(
            hintText: 'اختر نوع الخدمة',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          items: ServiceType.values
              .map(
                (type) => DropdownMenuItem(
                  value: type,
                  child: Text(_getServiceTypeLabel(type)),
                ),
              )
              .toList(),
          onChanged: (value) => setState(() => _selectedType = value),
          validator: (value) {
            if (value == null) {
              return 'الرجاء اختيار نوع الخدمة';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'اسم الخدمة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            hintText: 'مثال: مغسل الرحمة - القاهرة',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'الرجاء إدخال اسم الخدمة';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'رقم الهاتف',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _phoneController,
          decoration: InputDecoration(
            hintText: '01012345678',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'الرجاء إدخال رقم الهاتف';
            }
            if (value.trim().length < 11) {
              return 'رقم الهاتف غير صحيح';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'المحافظة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _governorateController,
          decoration: InputDecoration(
            hintText: 'القاهرة',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'الرجاء إدخال المحافظة';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'المنطقة',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _areaController,
          decoration: InputDecoration(
            hintText: 'مدينة نصر',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'الرجاء إدخال المنطقة';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Checkbox(
              value: _isFree,
              onChanged: (value) => setState(() => _isFree = value ?? true),
              activeColor: AppColors.accent,
            ),
            const Text(
              'خدمة مجانية',
              style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'تفاصيل إضافية (اختياري)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _detailsController,
          decoration: InputDecoration(
            hintText: 'أي معلومات إضافية عن الخدمة',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: AppColors.surface,
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}

class _ModeButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

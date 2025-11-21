import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entity/funeral_entity.dart';
import '../providers/funeral_provider.dart';

class AddFuneralScreen extends ConsumerStatefulWidget {
  const AddFuneralScreen({super.key});

  @override
  ConsumerState<AddFuneralScreen> createState() => _AddFuneralScreenState();
}

class _AddFuneralScreenState extends ConsumerState<AddFuneralScreen> {
  final _formKey = GlobalKey<FormState>();
  final _deceasedNameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _mosqueNameController = TextEditingController();
  final _mosqueLocationController = TextEditingController();
  final _notesController = TextEditingController();

  String _gender = 'male';
  DateTime _selectedDateTime = DateTime.now().add(const Duration(hours: 2));
  double? _selectedLat;
  double? _selectedLng;
  File? _selectedImage;
  bool _isLoading = false;

  @override
  void dispose() {
    _deceasedNameController.dispose();
    _fatherNameController.dispose();
    _mosqueNameController.dispose();
    _mosqueLocationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );

      if (time != null) {
        setState(() {
          _selectedDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Future<void> _selectLocation() async {
    // TODO: Implement Google Maps picker
    // For now, use default coordinates
    setState(() {
      _selectedLat = 30.0444;
      _selectedLng = 31.2357;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تحديد الموقع - القاهرة')),
      );
    }
  }

  Future<void> _submitFuneral() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedLat == null || _selectedLng == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجى تحديد موقع المسجد')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final funeral = FuneralEntity(
        id: '',
        deceasedName: _deceasedNameController.text.isEmpty
            ? 'فقيد عائلة ${_fatherNameController.text}'
            : _deceasedNameController.text,
        gender: _gender,
        mosqueName: _mosqueNameController.text,
        mosqueLocation: _mosqueLocationController.text,
        lat: _selectedLat!,
        lng: _selectedLng!,
        prayerTime: _selectedDateTime,
        publisherId: 'anonymous',
        isMosqueVerified: false,
        createdAt: DateTime.now(),
        fatherName: _fatherNameController.text.isEmpty
            ? null
            : _fatherNameController.text,
        notes: _notesController.text.isEmpty ? null : _notesController.text,
        prayedCount: 0,
      );

      // TODO: Upload image if selected
      // TODO: Add funeral via provider

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم إضافة الجنازة بنجاح - جزاك الله خيراً'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pop(context);
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
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة جنازة'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'معلومات المتوفى',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _deceasedNameController,
              decoration: const InputDecoration(
                labelText: 'اسم المتوفى (اختياري)',
                hintText: 'سيتم استخدام "فقيد عائلة..." إذا ترك فارغاً',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _fatherNameController,
              decoration: const InputDecoration(
                labelText: 'اسم الأب أو العائلة',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _gender,
              decoration: const InputDecoration(
                labelText: 'النوع',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'male', child: Text('ذكر')),
                DropdownMenuItem(value: 'female', child: Text('أنثى')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _gender = value;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'معلومات المسجد والموقع',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _mosqueNameController,
              decoration: const InputDecoration(
                labelText: 'اسم المسجد *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال اسم المسجد';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _mosqueLocationController,
              decoration: const InputDecoration(
                labelText: 'عنوان المسجد *',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'يرجى إدخال عنوان المسجد';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _selectLocation,
              icon: const Icon(Icons.location_on),
              label: Text(
                _selectedLat != null
                    ? 'تم تحديد الموقع'
                    : 'حدد موقع المسجد على الخريطة',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.info,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'وقت الصلاة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              tileColor: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              leading: const Icon(Icons.access_time, color: AppColors.accent),
              title: Text(
                DateFormat(
                  'EEEE، d MMMM yyyy - h:mm a',
                  'ar',
                ).format(_selectedDateTime),
              ),
              trailing: const Icon(Icons.edit),
              onTap: _selectDateTime,
            ),
            const SizedBox(height: 24),
            const Text(
              'معلومات إضافية',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'ملاحظات (اختياري)',
                hintText: 'مثل: موقف السيارات، معلومات إضافية',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            if (_selectedImage != null)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _selectedImage!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedImage = null;
                        });
                      },
                      icon: const Icon(Icons.close),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.add_photo_alternate),
              label: const Text('إضافة صورة (اختياري)'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitFuneral,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(20),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('نشر الجنازة'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

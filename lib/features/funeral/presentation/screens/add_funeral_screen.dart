import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entity/funeral_entity.dart';
import '../providers/funeral_notifier.dart';
import 'map_picker_screen.dart';

class AddFuneralScreen extends ConsumerStatefulWidget {
  const AddFuneralScreen({super.key});

  @override
  ConsumerState<AddFuneralScreen> createState() => _AddFuneralScreenState();
}

class _AddFuneralScreenState extends ConsumerState<AddFuneralScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mosqueNameController = TextEditingController();
  final _deceasedNameController = TextEditingController();

  DateTime? _selectedDateTime;
  double? _selectedLat;
  double? _selectedLng;
  String _selectedGender = 'male';
  bool _isLoading = false;

  @override
  void dispose() {
    _mosqueNameController.dispose();
    _deceasedNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
    );

    if (date == null) return;

    if (!mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;

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

  Future<void> _selectLocation() async {
    final result = await Navigator.push<LatLng>(
      context,
      MaterialPageRoute(builder: (context) => const MapPickerScreen()),
    );

    if (result != null) {
      setState(() {
        _selectedLat = result.latitude;
        _selectedLng = result.longitude;
      });
    }
  }

  Future<void> _submitFuneral() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedDateTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('من فضلك اختر موعد الصلاة')));
      return;
    }

    if (_selectedLat == null || _selectedLng == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('من فضلك اختر موقع المسجد')));
      return;
    }

    setState(() => _isLoading = true);

    final funeral = FuneralEntity(
      id: '',
      deceasedName: _deceasedNameController.text.trim().isEmpty
          ? 'غير معروف'
          : _deceasedNameController.text.trim(),
      gender: _selectedGender,
      mosqueName: _mosqueNameController.text.trim(),
      mosqueLocation: _mosqueNameController.text.trim(),
      lat: _selectedLat!,
      lng: _selectedLng!,
      prayerTime: _selectedDateTime!,
      publisherId: '',
      isMosqueVerified: false,
      createdAt: DateTime.now(),
      prayedCount: 0,
    );

    await ref.read(funeralProvider.notifier).addFuneral(funeral);

    if (!mounted) return;

    ref.listen<AsyncValue<void>>(funeralProvider, (previous, next) {
      next.when(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إضافة الجنازة بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        },
        error: (error, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('حدث خطأ: $error'),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {},
      );
    });

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة جنازة')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _mosqueNameController,
                decoration: const InputDecoration(
                  labelText: 'اسم المسجد *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'من فضلك أدخل اسم المسجد';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _deceasedNameController,
                decoration: const InputDecoration(
                  labelText: 'اسم المتوفى (اختياري)',
                  border: OutlineInputBorder(),
                  hintText: 'سيكتب "فقيد عائلة..." إذا تُرك فارغًا',
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(
                  labelText: 'الجنس *',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'male', child: Text('ذكر')),
                  DropdownMenuItem(value: 'female', child: Text('أنثى')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedGender = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: _selectDateTime,
                icon: const Icon(Icons.access_time),
                label: Text(
                  _selectedDateTime == null
                      ? 'اختر موعد الصلاة *'
                      : 'الموعد: ${_selectedDateTime!.day}/${_selectedDateTime!.month} - ${_selectedDateTime!.hour}:${_selectedDateTime!.minute.toString().padLeft(2, '0')}',
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: _selectLocation,
                icon: const Icon(Icons.location_on),
                label: Text(
                  _selectedLat == null
                      ? 'اختر موقع المسجد *'
                      : 'تم اختيار الموقع ✓',
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  foregroundColor: _selectedLat != null ? Colors.green : null,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitFuneral,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: AppColors.primary,
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'إضافة الجنازة',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

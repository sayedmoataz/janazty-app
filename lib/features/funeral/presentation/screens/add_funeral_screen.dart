import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_outlined_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../domain/entity/funeral_entity.dart';
import '../providers/funeral_notifier.dart';
// import 'map_picker_screen.dart';

class AddFuneralScreen extends ConsumerStatefulWidget {
  const AddFuneralScreen({super.key});

  @override
  ConsumerState<AddFuneralScreen> createState() => _AddFuneralScreenState();
}

class _AddFuneralScreenState extends ConsumerState<AddFuneralScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mosqueNameController = TextEditingController();
  final _deceasedNameController = TextEditingController();
  final _burialLocationController = TextEditingController();
  final _funeralNotesController = TextEditingController();
  final _deceasedNotesController = TextEditingController();

  DateTime? _selectedDateTime;
  // double? _selectedLat;
  // double? _selectedLng;
  String _selectedGender = 'male';
  String _selectedAgeType = 'adult';
  bool _isLoading = false;

  @override
  void dispose() {
    _mosqueNameController.dispose();
    _deceasedNameController.dispose();
    _burialLocationController.dispose();
    _funeralNotesController.dispose();
    _deceasedNotesController.dispose();
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

  // TODO: Uncomment when map selection is ready
  // Future<void> _selectLocation() async {
  //   final result = await Navigator.push<LatLng>(
  //     context,
  //     MaterialPageRoute(builder: (context) => const MapPickerScreen()),
  //   );
  //
  //   if (result != null) {
  //     setState(() {
  //       _selectedLat = result.latitude;
  //       _selectedLng = result.longitude;
  //     });
  //   }
  // }

  Future<void> _submitFuneral() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.pleaseSelectPrayerTime)),
      );
      return;
    }

    // TODO: Uncomment when map selection is ready
    // if (_selectedLat == null || _selectedLng == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text(AppStrings.pleaseSelectLocation)),
    //   );
    //   return;
    // }

    setState(() => _isLoading = true);

    final funeral = FuneralEntity(
      id: '',
      deceasedName: _deceasedNameController.text.trim().isEmpty
          ? AppStrings.unknownDeceased
          : _deceasedNameController.text.trim(),
      gender: _selectedGender,
      mosqueName: _mosqueNameController.text.trim(),
      mosqueLocation: _mosqueNameController.text.trim(),
      lat: 0.0, // TODO: Use _selectedLat when map is ready
      lng: 0.0, // TODO: Use _selectedLng when map is ready
      prayerTime: _selectedDateTime!,
      publisherId: '',
      isMosqueVerified: false,
      createdAt: DateTime.now(),
      prayedCount: 0,
      burialLocation: _burialLocationController.text.trim().isEmpty
          ? null
          : _burialLocationController.text.trim(),
      ageType: _selectedAgeType,
      funeralNotes: _funeralNotesController.text.trim().isEmpty
          ? null
          : _funeralNotesController.text.trim(),
      notes: _deceasedNotesController.text.trim().isEmpty
          ? null
          : _deceasedNotesController.text.trim(),
    );

    try {
      await ref.read(funeralProvider.notifier).addFuneral(funeral);

      if (!mounted) return;

      setState(() => _isLoading = false);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.funeralAddedSuccess),
          backgroundColor: AppColors.success,
        ),
      );

      // Reset form
      _formKey.currentState!.reset();
      _mosqueNameController.clear();
      _deceasedNameController.clear();
      _burialLocationController.clear();
      _funeralNotesController.clear();
      _deceasedNotesController.clear();
      setState(() {
        _selectedDateTime = null;
        _selectedGender = 'male';
        _selectedAgeType = 'adult';
      });

      // Navigate to home screen
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } catch (error) {
      if (!mounted) return;

      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${AppStrings.errorOccurred}: $error'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: _deceasedNameController,
                labelText: AppStrings.deceasedNameLabel,
                hintText: AppStrings.deceasedNameHint,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(
                  labelText: AppStrings.genderLabel,
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'male',
                    child: Text(AppStrings.genderMale),
                  ),
                  DropdownMenuItem(
                    value: 'female',
                    child: Text(AppStrings.genderFemale),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedGender = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              // Age Type Radio Buttons
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.ageTypeLabel,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text(AppStrings.ageTypeAdult),
                          value: 'adult',
                          groupValue: _selectedAgeType,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _selectedAgeType = value);
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text(AppStrings.ageTypeChild),
                          value: 'child',
                          groupValue: _selectedAgeType,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _selectedAgeType = value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _burialLocationController,
                labelText: AppStrings.burialLocationLabel,
                hintText: AppStrings.burialLocationHint,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _mosqueNameController,
                labelText: AppStrings.mosqueNameLabel,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return AppStrings.pleaseEnterMosqueName;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _funeralNotesController,
                labelText: AppStrings.funeralNotesLabel,
                hintText: AppStrings.funeralNotesHint,
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _deceasedNotesController,
                labelText: AppStrings.deceasedNotesLabel,
                hintText: AppStrings.deceasedNotesHint,
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomOutlinedButton(
                onPressed: _selectDateTime,
                icon: Icons.access_time,
                label: _selectedDateTime == null
                    ? AppStrings.selectPrayerTime
                    : 'الموعد: ${_selectedDateTime!.day}/${_selectedDateTime!.month} - ${_selectedDateTime!.hour}:${_selectedDateTime!.minute.toString().padLeft(2, '0')}',
              ),
              const SizedBox(height: 16),
              // TODO: Uncomment when map selection is ready
              // CustomOutlinedButton(
              //   onPressed: _selectLocation,
              //   icon: Icons.location_on,
              //   label: _selectedLat == null
              //       ? AppStrings.selectMosqueLocation
              //       : AppStrings.locationSelected,
              //   foregroundColor: _selectedLat != null ? AppColors.success : null,
              // ),
              // const SizedBox(height: 32),
              const SizedBox(height: 16),
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
                          color: AppColors.white,
                        ),
                      )
                    : const Text(
                        AppStrings.submitFuneral,
                        style: TextStyle(fontSize: 16, color: AppColors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

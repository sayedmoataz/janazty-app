import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class NoFuneralScreen extends StatelessWidget {
  const NoFuneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStrings.noJanazah,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
      ),
    );
  }
}

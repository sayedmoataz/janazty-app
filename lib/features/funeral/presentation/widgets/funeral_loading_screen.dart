import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class FuneralLoadingScreen extends StatelessWidget {
  const FuneralLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.accent),
    );
  }
}

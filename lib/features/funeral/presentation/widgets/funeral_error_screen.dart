import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class FuneralErrorScreen extends StatelessWidget {
  const FuneralErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('حدث خطأ', style: TextStyle(color: AppColors.error)),
    );
  }
}

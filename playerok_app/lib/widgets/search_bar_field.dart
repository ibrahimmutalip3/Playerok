import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SearchBarField extends StatelessWidget {
  final String hint;

  const SearchBarField({
    super.key,
    this.hint = 'Найти игру или услугу',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          const Icon(Icons.search_rounded, color: AppColors.textTertiary, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hint,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textTertiary),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.tune_rounded, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }
}

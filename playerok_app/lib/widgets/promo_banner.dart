import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class PromoBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;
  final double width;

  const PromoBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
    this.width = 250,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: -14,
            bottom: -14,
            child: Icon(
              icon,
              size: 108,
              color: Colors.white.withValues(alpha: 0.14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.h3.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PromoBannerData {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;

  const PromoBannerData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
  });

  static const List<PromoBannerData> all = [
    PromoBannerData(
      title: 'Стать продавцом',
      subtitle: 'Продавай товары и услуги — зарабатывай деньги',
      icon: Icons.storefront_rounded,
      colors: [AppColors.primaryDark, AppColors.primary],
    ),
    PromoBannerData(
      title: 'Скидки',
      subtitle: 'Товары по скидке до -90%. Успей купить по низкой цене!',
      icon: Icons.local_fire_department_rounded,
      colors: [Color(0xFFD9432E), Color(0xFFF5A524)],
    ),
    PromoBannerData(
      title: 'Отзывы',
      subtitle: 'Проверенные продавцы с отзывами. Каждая сделка защищена!',
      icon: Icons.shield_rounded,
      colors: [Color(0xFF1B1F24), Color(0xFF2B323A)],
    ),
  ];
}

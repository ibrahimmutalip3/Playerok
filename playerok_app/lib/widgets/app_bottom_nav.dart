import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<_NavItemData> _items = [
    _NavItemData(icon: Icons.storefront_outlined, activeIcon: Icons.storefront_rounded, label: 'Магазин'),
    _NavItemData(icon: Icons.grid_view_outlined, activeIcon: Icons.grid_view_rounded, label: 'Категории'),
    _NavItemData(icon: Icons.chat_bubble_outline_rounded, activeIcon: Icons.chat_bubble_rounded, label: 'Чаты'),
    _NavItemData(icon: Icons.receipt_long_outlined, activeIcon: Icons.receipt_long_rounded, label: 'Сделки'),
    _NavItemData(icon: Icons.person_outline_rounded, activeIcon: Icons.person_rounded, label: 'Профиль'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            children: List.generate(_items.length, (index) {
              final item = _items[index];
              final selected = index == currentIndex;
              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Icon(
                            selected ? item.activeIcon : item.icon,
                            color: selected ? AppColors.primary : AppColors.textTertiary,
                            size: 24,
                          ),
                          if (item.label == 'Чаты')
                            Positioned(
                              right: -6,
                              top: -4,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                decoration: BoxDecoration(
                                  color: AppColors.badge,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '2',
                                  style: AppTextStyles.caption.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: AppTextStyles.navLabel.copyWith(
                          color: selected ? AppColors.primary : AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const _NavItemData({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/search_bar_field.dart';
import '../widgets/game_category_card.dart';
import '../widgets/product_category_tile.dart';
import '../widgets/listing_card.dart';
import '../widgets/promo_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildTopBar(context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: const SearchBarField(),
            ),
          ),
          SliverToBoxAdapter(child: _buildHeroBanner(context)),
          SliverToBoxAdapter(child: _buildPlatformShortcuts(context)),
          SliverToBoxAdapter(child: _buildSectionHeader('Категории', 'Все')),
          SliverToBoxAdapter(child: _buildProductCategoriesGrid(context)),
          SliverToBoxAdapter(child: _buildSectionHeader('Популярные игры', 'Все игры')),
          SliverToBoxAdapter(child: _buildGamesCarousel(context)),
          SliverToBoxAdapter(child: _buildSectionHeader('Рекомендуем', 'Смотреть все')),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            sliver: _buildListingsGrid(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.asset(
              'assets/images/logo.png',
              width: 34,
              height: 34,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Text('Playerok', style: AppTextStyles.h2),
          const Spacer(),
          _buildIconButton(Icons.card_giftcard_rounded, () {}),
          const SizedBox(width: 8),
          _buildIconButton(Icons.notifications_none_rounded, () {}),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 20),
      ),
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    return SizedBox(
      height: 148,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        scrollDirection: Axis.horizontal,
        itemCount: PromoBannerData.all.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final data = PromoBannerData.all[index];
          return PromoBanner(
            title: data.title,
            subtitle: data.subtitle,
            icon: data.icon,
            colors: data.colors,
          );
        },
      ),
    );
  }

  Widget _buildPlatformShortcuts(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        scrollDirection: Axis.horizontal,
        itemCount: MockData.platformShortcuts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final label = MockData.platformShortcuts[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionLabel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        children: [
          Text(title, style: AppTextStyles.h2),
          const Spacer(),
          Text(
            actionLabel,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCategoriesGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: MockData.productCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.92,
        ),
        itemBuilder: (context, index) {
          return ProductCategoryTile(category: MockData.productCategories[index]);
        },
      ),
    );
  }

  Widget _buildGamesCarousel(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: MockData.games.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return GameCategoryCard(category: MockData.games[index]);
        },
      ),
    );
  }

  Widget _buildListingsGrid(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.66,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListingCard(listing: MockData.listings[index]);
        },
        childCount: MockData.listings.length,
      ),
    );
  }
}

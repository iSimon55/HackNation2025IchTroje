import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/data/mock_data.dart';
import '../../core/models/poi.dart';

class POIDetailsScreen extends StatefulWidget {
  final POI poi;

  const POIDetailsScreen({
    super.key,
    required this.poi,
  });

  @override
  State<POIDetailsScreen> createState() => _POIDetailsScreenState();
}

class _POIDetailsScreenState extends State<POIDetailsScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isFavorite = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _isFavorite = widget.poi.isFavorite;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildHeroGallery(),
          _buildContentHeader(),
          _buildCTAButtons(),
          _buildDescription(),
          _buildCuriosities(),
          _buildPracticalInfo(),
          _buildNearby(),
          const SliverPadding(padding: EdgeInsets.only(bottom: AppSpacing.xl)),
        ],
      ),
    );
  }

  Widget _buildHeroGallery() {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: false,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.3),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.3),
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? AppColors.error : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.3),
            child: IconButton(
              icon: const Icon(Icons.share, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: widget.poi.images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.poi.images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.backgroundGray,
                      child: const Icon(Icons.image, size: 64),
                    );
                  },
                );
              },
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.poi.images.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 8 : 6,
                    height: _currentPage == index ? 8 : 6,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentHeader() {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.poi.name,
              style: AppTextStyles.h1,
            ),
            const SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.warning, size: 20),
                const SizedBox(width: 4),
                Text(
                  '${widget.poi.rating}',
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' (${widget.poi.reviewCount} opinii)',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.m),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: widget.poi.tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.m,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '#$tag',
                    style: AppTextStyles.tag,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCTAButtons() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.m,
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.navigation),
                    const SizedBox(width: AppSpacing.s),
                    Text(
                      'PROWADŹ MNIE TAM',
                      style: AppTextStyles.button,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.s),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.backgroundGray,
                        side: BorderSide.none,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.headphones, size: 20),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            'Audio',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.s),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.backgroundGray,
                        side: BorderSide.none,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.photo_library, size: 20),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            'Galeria',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'O Miejscu',
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: AppSpacing.s),
            Text(
              widget.poi.description,
              style: AppTextStyles.body,
              maxLines: _isExpanded ? null : 4,
              overflow: _isExpanded ? null : TextOverflow.ellipsis,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(
                _isExpanded ? 'Zwiń ↑' : 'Czytaj więcej ↓',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCuriosities() {
    if (widget.poi.curiosities.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.m),
          decoration: BoxDecoration(
            color: AppColors.curiosityBackground,
            borderRadius: BorderRadius.circular(AppRadius.medium),
            border: Border(
              left: BorderSide(
                color: AppColors.warning,
                width: 4,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('💡', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    'Ciekawostki',
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.gastronomyOrange,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.s),
              ...widget.poi.curiosities.map((curiosity) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontSize: 16)),
                      Expanded(
                        child: Text(
                          curiosity,
                          style: AppTextStyles.bodySmall,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPracticalInfo() {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.backgroundVeryLight,
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📍 Lokalizacja i Godziny',
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: AppSpacing.m),
            _buildInfoCard(
              icon: Icons.location_on,
              iconColor: AppColors.error,
              title: widget.poi.address,
              subtitle: 'Otwórz w mapach',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.s),
            _buildInfoCard(
              icon: Icons.access_time,
              iconColor: AppColors.success,
              title: widget.poi.openingHours,
              subtitle: widget.poi.price,
            ),
            if (widget.poi.accessibility.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.s),
              _buildInfoCard(
                icon: Icons.accessible,
                iconColor: AppColors.secondary,
                title: 'Dostępność',
                subtitle: widget.poi.accessibility.join('\n'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.m),
      decoration: BoxDecoration(
        color: AppColors.backgroundGray,
        borderRadius: BorderRadius.circular(AppRadius.medium),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.chevron_right, color: AppColors.textTertiary),
          ],
        ),
      ),
    );
  }

  Widget _buildNearby() {
    final nearbyPOIs = MockData.getNearby(widget.poi.id);

    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.backgroundVeryLight,
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📍 W Pobliżu (do 500m)',
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: AppSpacing.m),
            ...nearbyPOIs.map((poi) {
              return Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.s),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      poi.images.first,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 64,
                          height: 64,
                          color: AppColors.backgroundGray,
                          child: const Icon(Icons.image),
                        );
                      },
                    ),
                  ),
                  title: Text(
                    poi.name,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${poi.category} • ${poi.getDistance()}',
                    style: AppTextStyles.caption,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => POIDetailsScreen(poi: poi),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: AppSpacing.s),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.secondary, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.s),
                ),
                child: Text(
                  'Zobacz wszystkie w pobliżu',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

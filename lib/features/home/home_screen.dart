import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/data/category_data.dart';
import '../../core/data/discovery_data.dart';
import '../../core/models/discovery_item.dart';
import '../../core/services/location_service.dart';
import '../../core/services/discovery_storage_service.dart';
import '../discovery/discovery_screen.dart';
import '../attractions/attractions_screen.dart';
import '../map/map_screen.dart';
import '../category/category_detail_screen.dart';
import '../discovery/discovery_detail_screen.dart';
import 'widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  DiscoveryItem? _nearestAttraction;
  String? _nearestDistance;
  bool _isLoadingNearest = true;

  @override
  void initState() {
    super.initState();
    _loadNearestAttraction();
  }

  Future<void> _loadNearestAttraction() async {
    setState(() => _isLoadingNearest = true);

    try {
      final position = await LocationService.getCurrentPosition();
      if (position == null) {
        setState(() => _isLoadingNearest = false);
        return;
      }

      final discoveries = DiscoveryData.getAllDiscoveries();
      final savedDiscoveries = await DiscoveryStorageService.loadDiscoveries();

      for (int i = 0; i < discoveries.length; i++) {
        final savedData = savedDiscoveries[discoveries[i].id];
        if (savedData != null) {
          discoveries[i] = discoveries[i].copyWith(
            isUnlocked: true,
            userPhotoPath: savedData['userPhotoPath'],
            unlockedAt: savedData['unlockedAt'],
          );
        }
      }

      DiscoveryItem? nearest;
      double? minDistance;

      for (final discovery in discoveries) {
        final distance = LocationService.calculateDistance(
          position.latitude,
          position.longitude,
          discovery.latitude,
          discovery.longitude,
        );

        if (minDistance == null || distance < minDistance) {
          minDistance = distance;
          nearest = discovery;
        }
      }

      if (mounted && nearest != null) {
        setState(() {
          _nearestAttraction = nearest;
          _nearestDistance = LocationService.formatDistance(minDistance!);
          _isLoadingNearest = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingNearest = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 1) {
      return Scaffold(
        body: const MapScreen(),
        bottomNavigationBar: _buildBottomNav(),
      );
    } else if (_selectedIndex == 2) {
      return Scaffold(
        body: const DiscoveryScreen(),
        bottomNavigationBar: _buildBottomNav(),
      );
    } else if (_selectedIndex == 3) {
      return Scaffold(
        body: const AttractionsScreen(),
        bottomNavigationBar: _buildBottomNav(),
      );
    } else if (_selectedIndex == 4) {
      return Scaffold(
        body: const Center(child: Text('Więcej - Coming Soon')),
        bottomNavigationBar: _buildBottomNav(),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHeroHeader(),
            _buildCategories(),
            _buildNearestAttraction(),
            const SliverPadding(padding: EdgeInsets.only(bottom: AppSpacing.xl)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeroHeader() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            height: 280,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/stare-miasto-bydgoszcz.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.4),
                  AppColors.backgroundLight.withOpacity(0.8),
                  AppColors.backgroundLight,
                ],
                stops: const [0.0, 0.4, 0.85, 1.0],
              ),
            ),
          ),
          Positioned(
            left: AppSpacing.m,
            right: AppSpacing.m,
            top: AppSpacing.l,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.m,
                      vertical: AppSpacing.s,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '🏘️',
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          'ODKRYJ BYDGOSZCZ',
                          style: AppTextStyles.h1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.m,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Odkryj piękno miasta w interaktywny sposób',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearestAttraction() {
    if (_isLoadingNearest) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(AppSpacing.m),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      );
    }

    if (_nearestAttraction == null) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Najbliższa atrakcja',
                  style: AppTextStyles.h3,
                ),
                if (_nearestDistance != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.near_me,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _nearestDistance!,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.s),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiscoveryDetailScreen(
                        discovery: _nearestAttraction!,
                      ),
                    ),
                  );
                  _loadNearestAttraction();
                },
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: _nearestAttraction!.isUnlocked
                                ? [
                                    _nearestAttraction!.rarityColor.withOpacity(0.3),
                                    _nearestAttraction!.rarityColor.withOpacity(0.1),
                                  ]
                                : [
                                    Colors.grey.shade300,
                                    Colors.grey.shade200,
                                  ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: _nearestAttraction!.isUnlocked &&
                                _nearestAttraction!.userPhotoPath != null
                            ? Image.file(
                                File(_nearestAttraction!.userPhotoPath!),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Icon(
                                      Icons.photo_camera,
                                      size: 48,
                                      color: _nearestAttraction!.rarityColor.withOpacity(0.5),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Icon(
                                  _nearestAttraction!.isUnlocked
                                      ? Icons.photo_camera
                                      : Icons.lock,
                                  size: 48,
                                  color: _nearestAttraction!.isUnlocked
                                      ? _nearestAttraction!.rarityColor.withOpacity(0.5)
                                      : Colors.grey.shade400,
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.m),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _nearestAttraction!.rarityColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '#${_nearestAttraction!.number.toString().padLeft(3, '0')}',
                                  style: TextStyle(
                                    color: _nearestAttraction!.rarityColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (_nearestAttraction!.isUnlocked)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.success.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        size: 12,
                                        color: AppColors.success,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Odkryte',
                                        style: AppTextStyles.caption.copyWith(
                                          color: AppColors.success,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _nearestAttraction!.isUnlocked
                                ? _nearestAttraction!.name
                                : '???',
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _nearestAttraction!.isUnlocked
                                ? _nearestAttraction!.description
                                : _nearestAttraction!.hint,
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.navigation,
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Kliknij aby zobaczyć szczegóły',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCategory(String categoryId) {
    final category = CategoryData.getCategoryById(categoryId);
    if (category != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryDetailScreen(category: category),
        ),
      );
    }
  }

  Widget _buildCategories() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pierwszy raz w Bydgoszczy?',
                  style: AppTextStyles.h3,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
              children: [
                CategoryCard(
                  emoji: 'ℹ️',
                  label: 'O aplikacji',
                  color: AppColors.error,
                  onTap: () => _navigateToCategory('about_app'),
                ),
                CategoryCard(
                  emoji: '🚋',
                  label: 'Bilety komunikacyjne',
                  color: AppColors.secessionGold,
                  onTap: () => _navigateToCategory('public_transport'),
                ),
                CategoryCard(
                  emoji: '🎟️',
                  label: 'Bilet przejazdowy',
                  color: AppColors.industrialSteel,
                  onTap: () => _navigateToCategory('travel_pass'),
                ),
                CategoryCard(
                  emoji: '👀',
                  label: 'Obowiązkowe atrakcje',
                  color: AppColors.secondary,
                  onTap: () => _navigateToCategory('must_see'),
                ),
                CategoryCard(
                  emoji: '🚤',
                  label: 'Bydgoszcz na wodzie',
                  color: AppColors.culturePurple,
                  onTap: () => _navigateToCategory('water_routes'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textTertiary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Odkryj',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: 'Atrakcje',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Więcej',
        ),
      ],
    );
  }
}

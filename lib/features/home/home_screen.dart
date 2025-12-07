import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/event_info.dart';
import '../../core/data/event_data.dart';
import '../../core/data/category_data.dart';
import '../discovery/discovery_screen.dart';
import '../attractions/attractions_screen.dart';
import '../map/map_screen.dart';
import '../category/category_detail_screen.dart';
import 'widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

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
            _buildHeader(),
            _buildCategories(),
            _buildEvents(),
            const SliverPadding(padding: EdgeInsets.only(bottom: AppSpacing.xl)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.m),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '🏘️',
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'ODKRYJ BYDGOSZCZ',
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            )
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

  Widget _buildEvents() {
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
                  'Wydarzenia w mieście',
                  style: AppTextStyles.h3,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Zobacz więcej →',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
            child: Column(
              children: EventData.getAllEvents().map((event) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.m),
                  child: _buildEventCard(event),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.m),
        ],
      ),
    );
  }

  Widget _buildEventCard(EventInfo event) {
    final color = Color(int.parse('0xFF${event.colorHex}'));
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.m),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Text(
                  event.emoji,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: AppSpacing.s),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: AppTextStyles.h3.copyWith(
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14, color: color),
                          const SizedBox(width: 4),
                          Text(
                            event.date,
                            style: AppTextStyles.caption.copyWith(
                              color: color,
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
          Padding(
            padding: const EdgeInsets.all(AppSpacing.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event.location,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s),
                Text(
                  event.description,
                  style: AppTextStyles.body.copyWith(
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.s),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => _launchEventUrl(event.websiteUrl),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: color,
                      side: BorderSide(color: color),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Szczegóły wydarzenia'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchEventUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nie można otworzyć strony wydarzenia'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
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

import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/data/mock_data.dart';
import '../discovery/discovery_screen.dart';
import '../attractions/attractions_screen.dart';
import '../map/map_screen.dart';
import '../poi_details/poi_details_screen.dart';
import 'widgets/category_card.dart';
import 'widgets/quick_action_button.dart';

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
            _buildSearchBar(),
            _buildQuickAction(),
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
                  '🏛️',
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'ODKRYJ BYDGOSZCZ',
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                  color: AppColors.textPrimary,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    'U',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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

  Widget _buildSearchBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Szukaj miejsc, tras, wydarzeń...',
            hintStyle: AppTextStyles.body.copyWith(
              color: AppColors.textTertiary,
            ),
            prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary),
            filled: true,
            fillColor: AppColors.backgroundGray,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.m,
              vertical: AppSpacing.s,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction() {
    return SliverToBoxAdapter(
      child: QuickActionButton(
        title: 'ROZPOCZNIJ WYCIECZKĘ!',
        subtitle: 'Najbliższe: Wyspa Młyńska (1.2km)',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => POIDetailsScreen(poi: MockData.wyspaMlynska),
            ),
          );
        },
      ),
    );
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
                  'Odkrywaj Bydgoszcz',
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
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
              children: [
                CategoryCard(
                  emoji: '🏛️',
                  label: 'Secesja',
                  color: AppColors.secessionGold,
                  onTap: () {},
                ),
                CategoryCard(
                  emoji: '⚙️',
                  label: 'Industry',
                  color: AppColors.industrialSteel,
                  onTap: () {},
                ),
                CategoryCard(
                  emoji: '🚢',
                  label: 'Szlak Wodny',
                  color: AppColors.secondary,
                  onTap: () {},
                ),
                CategoryCard(
                  emoji: '📍',
                  label: 'Blisko Mnie',
                  color: AppColors.error,
                  onTap: () {},
                  badge: 12,
                ),
                CategoryCard(
                  emoji: '🎭',
                  label: 'Wydarzenia',
                  color: AppColors.culturePurple,
                  onTap: () {},
                  badge: 5,
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
              children: [
                _buildEventCard(
                  title: 'Jarmark Bożonarodzeniowy',
                  date: '1-24 grudnia 2025',
                  location: 'Stary Rynek',
                  description: 'Tradycyjny jarmark świąteczny z lokalnymi rękodzielnikami, '
                      'straganami z regionalnymi produktami i gorącym grzańcem. '
                      'Atmosfera świąt w sercu Starego Miasta!',
                  emoji: '🎄',
                  color: Colors.red.shade700,
                ),
                const SizedBox(height: AppSpacing.m),
                _buildEventCard(
                  title: 'HackNation 2025',
                  date: '6-8 grudnia 2025',
                  location: 'Uniwersytet Technologiczno-Przyrodniczy',
                  description: 'Największy hackathon w regionie! 48 godzin kodowania, '
                      'warsztaty, mentoring i networking. Wyzwania dla developerów, '
                      'projektantów i przedsiębiorców.',
                  emoji: '💻',
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.m),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String date,
    required String location,
    required String description,
    required String emoji,
    required Color color,
  }) {
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
                  emoji,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: AppSpacing.s),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
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
                            date,
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
                        location,
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
                  description,
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
                    onPressed: () {},
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

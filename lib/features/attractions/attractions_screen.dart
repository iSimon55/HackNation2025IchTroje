import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/data/mock_data.dart';
import '../../core/data/discovery_data.dart';
import '../../core/models/poi.dart';
import '../../core/services/favorites_storage_service.dart';
import '../../core/services/discovery_storage_service.dart';
import '../poi_details/poi_details_screen.dart';
import '../discovery/discovery_detail_screen.dart';

class AttractionsScreen extends StatefulWidget {
  const AttractionsScreen({super.key});

  @override
  State<AttractionsScreen> createState() => _AttractionsScreenState();
}

class _AttractionsScreenState extends State<AttractionsScreen> {
  List<POI> _allPOIs = [];
  List<String> _favoriteIds = [];
  Map<String, Map<String, dynamic>> _unlockedDiscoveries = {};
  bool _isLoading = true;
  String _filter = 'all';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    final favoriteIds = await FavoritesStorageService.loadFavorites();

    final unlockedDiscoveries = await DiscoveryStorageService.loadDiscoveries();

    final allPOIs = MockData.allPOIs.map((poi) {
      return poi.copyWith(isFavorite: favoriteIds.contains(poi.id));
    }).toList();

    allPOIs.sort((a, b) {
      if (a.isFavorite && !b.isFavorite) return -1;
      if (!a.isFavorite && b.isFavorite) return 1;
      return 0;
    });

    setState(() {
      _allPOIs = allPOIs;
      _favoriteIds = favoriteIds;
      _unlockedDiscoveries = unlockedDiscoveries;
      _isLoading = false;
    });
  }

  Future<void> _toggleFavorite(POI poi) async {
    final isFavorite = _favoriteIds.contains(poi.id);
    
    if (isFavorite) {
      await FavoritesStorageService.removeFavorite(poi.id);
      _favoriteIds.remove(poi.id);
    } else {
      await FavoritesStorageService.addFavorite(poi.id);
      _favoriteIds.add(poi.id);
    }

    setState(() {
      _allPOIs = _allPOIs.map((p) {
        if (p.id == poi.id) {
          return p.copyWith(isFavorite: !isFavorite);
        }
        return p;
      }).toList();

      _allPOIs.sort((a, b) {
        if (a.isFavorite && !b.isFavorite) return -1;
        if (!a.isFavorite && b.isFavorite) return 1;
        return 0;
      });
    });
  }

  bool _isAttractionUnlocked(POI poi) {
    final discoveryId = _getDiscoveryIdForPoi(poi);
    if (discoveryId == null) {
      return true;
    }
    
    return _unlockedDiscoveries.containsKey(discoveryId);
  }

  String? _getDiscoveryIdForPoi(POI poi) {
    final Map<String, String> poiToDiscoveryMap = {
      'Opera Nova': 'opera_nova',
      'Wyspa Młyńska': 'wyspa_mlynska',
      'Młyny Rothera': 'mlyny_rothera',
      'Kanał Bydgoski': 'kanal_bydgoski',
      'Stary Rynek': 'stary_rynek',
      'Europejskie Centrum Pieniądza': 'europejskie_centrum_pieniadza',
      'Most Młyński': 'most_mlynski',
    };
    
    return poiToDiscoveryMap[poi.name];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          'Atrakcje',
          style: AppTextStyles.h2,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildFilterChips(),
                Expanded(child: _buildAttractionsList()),
              ],
            ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.s,
      ),
      child: Row(
        children: [
          _buildFilterChip('Wszystkie', 'all'),
          const SizedBox(width: AppSpacing.s),
          _buildFilterChip('Odkryte', 'unlocked'),
          const SizedBox(width: AppSpacing.s),
          _buildFilterChip('Nieodkryte', 'locked'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _filter == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _filter = value;
        });
      },
      backgroundColor: Colors.white,
      selectedColor: AppColors.primary.withOpacity(0.2),
      checkmarkColor: AppColors.primary,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.textTertiary.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildAttractionsList() {
    if (_allPOIs.isEmpty) {
      return Center(
        child: Text(
          'Brak atrakcji',
          style: AppTextStyles.body.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
      );
    }

    List<POI> filteredPOIs = _allPOIs;
    if (_filter == 'unlocked') {
      filteredPOIs = _allPOIs.where((poi) => _isAttractionUnlocked(poi)).toList();
    } else if (_filter == 'locked') {
      filteredPOIs = _allPOIs.where((poi) => !_isAttractionUnlocked(poi)).toList();
    }

    if (filteredPOIs.isEmpty) {
      return Center(
        child: Text(
          _filter == 'unlocked' 
              ? 'Nie odkryłeś jeszcze żadnej atrakcji'
              : 'Wszystkie atrakcje zostały odkryte!',
          style: AppTextStyles.body.copyWith(
            color: AppColors.textTertiary,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.m),
      itemCount: filteredPOIs.length,
      itemBuilder: (context, index) {
        final poi = filteredPOIs[index];
        final isUnlocked = _isAttractionUnlocked(poi);

        return _buildAttractionCard(poi, isUnlocked);
      },
    );
  }

  Widget _buildAttractionCard(POI poi, bool isUnlocked) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.m),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () async {
          if (isUnlocked) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => POIDetailsScreen(poi: poi),
              ),
            );
            _loadData();
          } else {
            final discoveryId = _getDiscoveryIdForPoi(poi);
            if (discoveryId != null) {
              final discoveries = DiscoveryData.getAllDiscoveries();
              final discovery = discoveries.firstWhere(
                (d) => d.id == discoveryId,
                orElse: () => discoveries.first,
              );
              
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiscoveryDetailScreen(discovery: discovery),
                ),
              );
              
              _loadData();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Odkryj tę atrakcję w zakładce "Odkryj", aby zobaczyć szczegóły!'),
                  backgroundColor: AppColors.primary,
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    poi.images.first,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: AppColors.backgroundGray,
                        child: const Center(
                          child: Icon(Icons.image, size: 48, color: AppColors.textTertiary),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      poi.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: poi.isFavorite ? AppColors.error : Colors.white,
                    ),
                    onPressed: () => _toggleFavorite(poi),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ),
                if (!isUnlocked)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.lock, size: 16, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            'Nieodkryte',
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          poi.name,
                          style: AppTextStyles.h3,
                        ),
                      ),
                      if (isUnlocked)
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
                                size: 14,
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
                    isUnlocked 
                        ? poi.shortDescription 
                        : 'Odkryj tę atrakcję, aby poznać jej historię...',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  if (isUnlocked)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: poi.tags.take(3).map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundGray,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            tag,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  if (isUnlocked) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${poi.rating}',
                          style: AppTextStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${poi.reviewCount})',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

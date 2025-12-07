import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/data/discovery_data.dart';
import '../../core/models/discovery_item.dart';
import '../../core/services/favorites_storage_service.dart';
import '../../core/services/discovery_storage_service.dart';
import '../discovery/discovery_detail_screen.dart';

class AttractionsScreen extends StatefulWidget {
  const AttractionsScreen({super.key});

  @override
  State<AttractionsScreen> createState() => _AttractionsScreenState();
}

class _AttractionsScreenState extends State<AttractionsScreen> {
  List<DiscoveryItem> _allAttractions = [];
  List<String> _favoriteIds = [];
  bool _isLoading = true;
  String _filter = 'all';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    final favoriteIds = await FavoritesStorageService.loadFavorites();
    final unlockedDiscoveries = await DiscoveryStorageService.loadDiscoveries();
    
    final allAttractions = DiscoveryData.getAllDiscoveries();
    
    for (int i = 0; i < allAttractions.length; i++) {
      final savedData = unlockedDiscoveries[allAttractions[i].id];
      if (savedData != null) {
        allAttractions[i] = allAttractions[i].copyWith(
          isUnlocked: true,
          userPhotoPath: savedData['userPhotoPath'],
          unlockedAt: savedData['unlockedAt'],
        );
      }
    }

    allAttractions.sort((a, b) {
      final aFav = favoriteIds.contains(a.id);
      final bFav = favoriteIds.contains(b.id);
      if (aFav && !bFav) return -1;
      if (!aFav && bFav) return 1;
      return 0;
    });

    setState(() {
      _allAttractions = allAttractions;
      _favoriteIds = favoriteIds;
      _isLoading = false;
    });
  }

  Future<void> _toggleFavorite(DiscoveryItem attraction) async {
    final isFavorite = _favoriteIds.contains(attraction.id);
    
    if (isFavorite) {
      await FavoritesStorageService.removeFavorite(attraction.id);
      _favoriteIds.remove(attraction.id);
    } else {
      await FavoritesStorageService.addFavorite(attraction.id);
      _favoriteIds.add(attraction.id);
    }

    setState(() {});
  }

  List<DiscoveryItem> _getFilteredAttractions() {
    var filtered = _allAttractions;

    if (_filter == 'unlocked') {
      filtered = filtered.where((a) => a.isUnlocked).toList();
    } else if (_filter == 'locked') {
      filtered = filtered.where((a) => !a.isUnlocked).toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((a) {
        final query = _searchQuery.toLowerCase();
        return a.name.toLowerCase().contains(query) ||
               a.category.toLowerCase().contains(query) ||
               a.tags.any((tag) => tag.toLowerCase().contains(query)) ||
               (a.isUnlocked && a.description.toLowerCase().contains(query));
      }).toList();
    }

    return filtered;
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
                _buildSearchBar(),
                _buildFilterChips(),
                Expanded(child: _buildAttractionsList()),
              ],
            ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.m),
      color: Colors.white,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Szukaj atrakcji...',
          hintStyle: AppTextStyles.body.copyWith(
            color: AppColors.textTertiary,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: AppColors.textTertiary),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
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
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
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
    final filteredAttractions = _getFilteredAttractions();

    if (filteredAttractions.isEmpty) {
      return Center(
        child: Text(
          _searchQuery.isNotEmpty
              ? 'Nie znaleziono atrakcji'
              : _filter == 'unlocked' 
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
      itemCount: filteredAttractions.length,
      itemBuilder: (context, index) {
        final attraction = filteredAttractions[index];
        return _buildAttractionCard(attraction);
      },
    );
  }

  Widget _buildAttractionCard(DiscoveryItem attraction) {
    final isFavorite = _favoriteIds.contains(attraction.id);
    
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.m),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DiscoveryDetailScreen(discovery: attraction),
            ),
          );
          _loadData();
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: attraction.isUnlocked
                            ? [attraction.rarityColor.withOpacity(0.3), attraction.rarityColor.withOpacity(0.1)]
                            : [Colors.grey.shade300, Colors.grey.shade200],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: attraction.isUnlocked && attraction.userPhotoPath != null
                        ? Image.file(
                            File(attraction.userPhotoPath!),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(
                                  Icons.photo_camera,
                                  size: 64,
                                  color: attraction.rarityColor.withOpacity(0.5),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Icon(
                              attraction.isUnlocked ? Icons.photo_camera : Icons.lock,
                              size: 64,
                              color: attraction.isUnlocked 
                                  ? attraction.rarityColor.withOpacity(0.5)
                                  : Colors.grey.shade400,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? AppColors.error : Colors.white,
                    ),
                    onPressed: () => _toggleFavorite(attraction),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ),
                if (!attraction.isUnlocked)
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
                Positioned(
                  top: 8,
                  left: attraction.isUnlocked ? 8 : null,
                  right: attraction.isUnlocked ? null : 60,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: attraction.rarityColor.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '#${attraction.number.toString().padLeft(3, '0')}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
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
                          attraction.isUnlocked ? attraction.name : '???',
                          style: AppTextStyles.h3,
                        ),
                      ),
                      if (attraction.isUnlocked)
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
                    attraction.isUnlocked 
                        ? attraction.description 
                        : attraction.hint,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: attraction.tags.take(3).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: attraction.isUnlocked
                              ? AppColors.backgroundGray
                              : Colors.grey.shade300,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

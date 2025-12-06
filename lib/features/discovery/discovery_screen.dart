import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/data/discovery_data.dart';
import '../../core/models/discovery_item.dart';
import '../../core/services/discovery_storage_service.dart';
import 'discovery_detail_screen.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  late List<DiscoveryItem> discoveries;
  int totalDiscovered = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDiscoveries();
  }

  Future<void> _loadDiscoveries() async {
    discoveries = DiscoveryData.getAllDiscoveries();
    
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
    
    setState(() {
      _calculateStats();
      isLoading = false;
    });
  }

  void _calculateStats() {
    totalDiscovered = discoveries.where((d) => d.isUnlocked).length;
  }

  void _onDiscoveryTap(DiscoveryItem discovery, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiscoveryDetailScreen(discovery: discovery),
      ),
    );

    if (result is DiscoveryItem) {
      setState(() {
        discoveries[index] = result;
        _calculateStats();
      });
      
      await DiscoveryStorageService.saveDiscoveries(discoveries);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.primaryDark,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Bydgoski pamiętnik',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primaryDark,
                      AppColors.primaryLight,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      '🏆',
                      style: TextStyle(fontSize: 48),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$totalDiscovered / ${discoveries.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Odkryte miejsca',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.m),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: AppSpacing.m,
                mainAxisSpacing: AppSpacing.m,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final discovery = discoveries[index];
                  return _DiscoveryCard(
                    discovery: discovery,
                    onTap: () => _onDiscoveryTap(discovery, index),
                  );
                },
                childCount: discoveries.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscoveryCard extends StatelessWidget {
  final DiscoveryItem discovery;
  final VoidCallback onTap;

  const _DiscoveryCard({
    required this.discovery,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: discovery.isUnlocked
                  ? [
                      discovery.rarityColor.withOpacity(0.2),
                      discovery.rarityColor.withOpacity(0.1),
                    ]
                  : [
                      Colors.grey.shade300,
                      Colors.grey.shade200,
                    ],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  color: discovery.isUnlocked
                      ? discovery.rarityColor.withOpacity(0.3)
                      : Colors.grey.shade400,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#${discovery.number.toString().padLeft(3, '0')}',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: discovery.isUnlocked
                            ? AppColors.textPrimary
                            : Colors.grey.shade600,
                      ),
                    ),
                    if (discovery.isUnlocked)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: discovery.rarityColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          discovery.rarityLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              Expanded(
                child: Center(
                  child: discovery.isUnlocked
                      ? (discovery.userPhotoPath != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(discovery.userPhotoPath!),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return _buildPlaceholder(true);
                                },
                              ),
                            )
                          : _buildPlaceholder(true))
                      : _buildPlaceholder(false),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(AppSpacing.s),
                child: Column(
                  children: [
                    Text(
                      discovery.isUnlocked ? discovery.name : '???',
                      style: AppTextStyles.h3.copyWith(
                        color: discovery.isUnlocked
                            ? AppColors.textPrimary
                            : Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      discovery.isUnlocked ? discovery.category : 'Nieodkryte',
                      style: AppTextStyles.caption.copyWith(
                        color: discovery.isUnlocked
                            ? AppColors.textSecondary
                            : Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(bool unlocked) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.m),
      decoration: BoxDecoration(
        color: unlocked ? Colors.grey.shade200 : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          unlocked ? '📸' : '❓',
          style: const TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}

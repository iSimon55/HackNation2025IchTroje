import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/models/discovery_item.dart';
import '../../core/services/location_service.dart';

class DiscoveryDetailScreen extends StatefulWidget {
  final DiscoveryItem discovery;

  const DiscoveryDetailScreen({
    super.key,
    required this.discovery,
  });

  @override
  State<DiscoveryDetailScreen> createState() => _DiscoveryDetailScreenState();
}

class _DiscoveryDetailScreenState extends State<DiscoveryDetailScreen> {
  final ImagePicker _picker = ImagePicker();
  late DiscoveryItem _discovery;
  String? _distanceText;
  bool _isLoadingDistance = false;

  @override
  void initState() {
    super.initState();
    _discovery = widget.discovery;
    if (!_discovery.isUnlocked) {
      _loadDistance();
    }
  }

  Future<void> _loadDistance() async {
    if (_isLoadingDistance) return;
    
    setState(() => _isLoadingDistance = true);
    
    final distance = await LocationService.getDistanceToPoint(
      _discovery.latitude,
      _discovery.longitude,
    );
    
    if (mounted) {
      setState(() {
        _distanceText = distance;
        _isLoadingDistance = false;
      });
    }
  }

 Future<void> _openInGoogleMaps() async {
  final Uri googleMapUrl = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=${_discovery.latitude},${_discovery.longitude}'
  );

  final bool launched = await launchUrl(
    googleMapUrl,
    mode: LaunchMode.externalApplication,
  );

  if (!launched && mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Nie można otworzyć Google Maps'),
        backgroundColor: Colors.red,
      ),
    );
  }
}


  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _discovery = _discovery.copyWith(
            isUnlocked: true,
            userPhotoPath: image.path,
            unlockedAt: DateTime.now(),
          );
        });

        if (mounted) {
          _showUnlockDialog();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Błąd podczas wybierania zdjęcia: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _discovery = _discovery.copyWith(
            isUnlocked: true,
            userPhotoPath: image.path,
            unlockedAt: DateTime.now(),
          );
        });

        if (mounted) {
          _showUnlockDialog();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Błąd podczas wybierania zdjęcia: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _showUnlockDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: _discovery.rarityColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '🎉',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Gratulacje!',
                style: AppTextStyles.h1.copyWith(
                  color: _discovery.rarityColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Odkryłeś:',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _discovery.name,
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: _discovery.rarityColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _discovery.rarityLabel,
                  style: TextStyle(
                    color: _discovery.rarityColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, _discovery);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _discovery.rarityColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Super!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Dodaj zdjęcie miejsca',
                style: AppTextStyles.h2,
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: AppColors.primaryDark,
                  ),
                ),
                title: const Text('Zrób zdjęcie'),
                subtitle: const Text('Użyj aparatu'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.photo_library,
                    color: AppColors.secondary,
                  ),
                ),
                title: const Text('Wybierz z galerii'),
                subtitle: const Text('Użyj istniejącego zdjęcia'),
                onTap: () {
                  Navigator.pop(context);
                  _pickFromGallery();
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: _discovery.isUnlocked
                ? _discovery.rarityColor
                : Colors.grey,
            flexibleSpace: FlexibleSpaceBar(
              background: _discovery.isUnlocked && _discovery.userPhotoPath != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(_discovery.userPhotoPath!),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: _discovery.isUnlocked
                              ? [
                                  _discovery.rarityColor,
                                  _discovery.rarityColor.withOpacity(0.6),
                                ]
                              : [
                                  Colors.grey.shade400,
                                  Colors.grey.shade600,
                                ],
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _discovery.isUnlocked ? '📸' : '❓',
                              style: const TextStyle(fontSize: 80),
                            ),
                            if (!_discovery.isUnlocked) ...[
                              const SizedBox(height: 16),
                              const Text(
                                'Nieodkryte',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: _discovery.isUnlocked
                                    ? _discovery.rarityColor.withOpacity(0.2)
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                '#${_discovery.number.toString().padLeft(3, '0')}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _discovery.isUnlocked
                                      ? _discovery.rarityColor
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (_discovery.isUnlocked)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: _discovery.rarityColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  _discovery.rarityLabel,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _discovery.isUnlocked ? _discovery.name : '???',
                          style: AppTextStyles.h1,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _discovery.isUnlocked
                              ? _discovery.category
                              : 'Nieodkryte miejsce',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(),

                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_discovery.isUnlocked) ...[
                          Text(
                            'O miejscu',
                            style: AppTextStyles.h2,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _discovery.description,
                            style: AppTextStyles.body.copyWith(height: 1.6),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '📍 Lokalizacja',
                                style: AppTextStyles.h3,
                              ),
                              TextButton.icon(
                                onPressed: _openInGoogleMaps,
                                icon: const Icon(Icons.map, size: 18),
                                label: const Text('Otwórz w Mapach'),
                                style: TextButton.styleFrom(
                                  foregroundColor: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _discovery.address,
                            style: AppTextStyles.body,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            '🏷️ Tagi',
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _discovery.tags.map((tag) {
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
                                  '#$tag',
                                  style: AppTextStyles.bodySmall,
                                ),
                              );
                            }).toList(),
                          ),
                          if (_discovery.unlockedAt != null) ...[
                            const SizedBox(height: 24),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _discovery.rarityColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _discovery.rarityColor.withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Text('✨', style: TextStyle(fontSize: 24)),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Odkryte',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          _formatDate(_discovery.unlockedAt!),
                                          style: AppTextStyles.caption,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ] else ...[
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.info.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.info.withOpacity(0.3),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('💡', style: TextStyle(fontSize: 24)),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Wskazówka',
                                      style: AppTextStyles.h3,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  _discovery.hint,
                                  style: AppTextStyles.body.copyWith(height: 1.6),
                                ),
                                if (_distanceText != null) ...[
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const Icon(Icons.near_me, size: 16, color: AppColors.primary),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Odległość: $_distanceText',
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      InkWell(
                                        onTap: _loadDistance,
                                        child: const Icon(
                                          Icons.refresh,
                                          size: 16,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                if (_isLoadingDistance) ...[
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(strokeWidth: 2),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Obliczanie odległości...',
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: _openInGoogleMaps,
                                    icon: const Icon(Icons.navigation),
                                    label: const Text('Nawiguj do miejsca'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Aby odblokować to miejsce, zrób jego zdjęcie!',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.textSecondary,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: !_discovery.isUnlocked
          ? FloatingActionButton.extended(
              onPressed: _showPhotoOptions,
              backgroundColor: AppColors.primaryDark,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Dodaj zdjęcie'),
            )
          : null,
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'stycznia', 'lutego', 'marca', 'kwietnia', 'maja', 'czerwca',
      'lipca', 'sierpnia', 'września', 'października', 'listopada', 'grudnia'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/data/discovery_data.dart';
import '../../core/models/discovery_item.dart';
import '../../core/services/discovery_storage_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  Map<String, Map<String, dynamic>> _unlockedDiscoveries = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final unlockedDiscoveries = await DiscoveryStorageService.loadDiscoveries();
    setState(() {
      _unlockedDiscoveries = unlockedDiscoveries;
      _isLoading = false;
    });
  }

  bool _isDiscoveryUnlocked(DiscoveryItem discovery) {
    return _unlockedDiscoveries.containsKey(discovery.id);
  }

  Future<void> _openInGoogleMaps(DiscoveryItem discovery) async {
    final url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${discovery.latitude},${discovery.longitude}'
    );
    
    final bool launched = await launchUrl(
    url,
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

  void _showMarkerPopup(DiscoveryItem discovery, bool isUnlocked) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    color: isUnlocked
                        ? discovery.rarityColor.withOpacity(0.2)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '#${discovery.number.toString().padLeft(3, '0')}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isUnlocked
                          ? discovery.rarityColor
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (isUnlocked)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: discovery.rarityColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      discovery.rarityLabel,
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
              isUnlocked ? discovery.name : '???',
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: 8),
            Text(
              isUnlocked ? discovery.category : 'Nieodkryta atrakcja',
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            if (!isUnlocked) ...[
              const SizedBox(height: 16),
              Text(
                '💡 ${discovery.hint}',
                style: AppTextStyles.body.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _openInGoogleMaps(discovery);
                },
                icon: const Icon(Icons.navigation),
                label: const Text('Nawiguj do miejsca'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final discoveries = DiscoveryData.getAllDiscoveries();

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(53.1235, 18.0084), // Opera Nova - centrum Bydgoszczy
              initialZoom: 13.5,
              minZoom: 11,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.hacknation2025',
              ),
              MarkerLayer(
                markers: discoveries.map((discovery) {
                  final isUnlocked = _isDiscoveryUnlocked(discovery);
                  
                  return Marker(
                    point: LatLng(discovery.latitude, discovery.longitude),
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () => _showMarkerPopup(discovery, isUnlocked),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: isUnlocked
                                  ? discovery.rarityColor
                                  : Colors.grey.shade400,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                isUnlocked
                                    ? discovery.number.toString()
                                    : '?',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (isUnlocked)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Text(
                                discovery.name,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mapa Bydgoszczy',
                      style: AppTextStyles.h2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Odkryte: ${_unlockedDiscoveries.length}/${discoveries.length}',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'zoom_in',
                  mini: true,
                  onPressed: () {
                    final currentZoom = _mapController.camera.zoom;
                    _mapController.move(
                      _mapController.camera.center,
                      currentZoom + 1,
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.add, color: AppColors.primary),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: 'zoom_out',
                  mini: true,
                  onPressed: () {
                    final currentZoom = _mapController.camera.zoom;
                    _mapController.move(
                      _mapController.camera.center,
                      currentZoom - 1,
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.remove, color: AppColors.primary),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: 'recenter',
                  mini: true,
                  onPressed: () {
                    _mapController.move(
                      const LatLng(53.1235, 18.0084),
                      13.5,
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.my_location, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

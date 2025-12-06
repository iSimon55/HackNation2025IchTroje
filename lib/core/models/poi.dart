class POI {
  final String id;
  final String name;
  final String description;
  final String shortDescription;
  final List<String> images;
  final double latitude;
  final double longitude;
  final double rating;
  final int reviewCount;
  final List<String> tags;
  final String address;
  final String openingHours;
  final String price;
  final List<String> accessibility;
  final List<String> curiosities;
  final String category;
  final bool isFavorite;

  POI({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.images,
    required this.latitude,
    required this.longitude,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.tags = const [],
    this.address = '',
    this.openingHours = '',
    this.price = '',
    this.accessibility = const [],
    this.curiosities = const [],
    this.category = '',
    this.isFavorite = false,
  });

  POI copyWith({
    String? id,
    String? name,
    String? description,
    String? shortDescription,
    List<String>? images,
    double? latitude,
    double? longitude,
    double? rating,
    int? reviewCount,
    List<String>? tags,
    String? address,
    String? openingHours,
    String? price,
    List<String>? accessibility,
    List<String>? curiosities,
    String? category,
    bool? isFavorite,
  }) {
    return POI(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      images: images ?? this.images,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      tags: tags ?? this.tags,
      address: address ?? this.address,
      openingHours: openingHours ?? this.openingHours,
      price: price ?? this.price,
      accessibility: accessibility ?? this.accessibility,
      curiosities: curiosities ?? this.curiosities,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  // Oblicz dystans od obecnej lokalizacji (mock)
  String getDistance() {
    // W prawdziwej aplikacji użyj geolocator
    return '${(latitude * 10 % 3).toStringAsFixed(1)}km';
  }
}

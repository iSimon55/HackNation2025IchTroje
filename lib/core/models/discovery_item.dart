import 'package:flutter/material.dart';

class DiscoveryItem {
  final int number;
  final String id;
  final String name;
  final String category;
  final String description;
  final String hint;
  final String address;
  final double latitude;
  final double longitude;
  final List<String> tags;
  final String rarity;
  
  bool isUnlocked;
  String? userPhotoPath;
  DateTime? unlockedAt;

  DiscoveryItem({
    required this.number,
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.hint,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.tags,
    required this.rarity,
    this.isUnlocked = false,
    this.userPhotoPath,
    this.unlockedAt,
  });

  DiscoveryItem copyWith({
    bool? isUnlocked,
    String? userPhotoPath,
    DateTime? unlockedAt,
  }) {
    return DiscoveryItem(
      number: number,
      id: id,
      name: name,
      category: category,
      description: description,
      hint: hint,
      address: address,
      latitude: latitude,
      longitude: longitude,
      tags: tags,
      rarity: rarity,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      userPhotoPath: userPhotoPath ?? this.userPhotoPath,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'hint': hint,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'tags': tags,
      'rarity': rarity,
      'isUnlocked': isUnlocked,
      'userPhotoPath': userPhotoPath,
      'unlockedAt': unlockedAt?.toIso8601String(),
    };
  }

  factory DiscoveryItem.fromJson(Map<String, dynamic> json) {
    return DiscoveryItem(
      number: json['number'],
      id: json['id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      hint: json['hint'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      tags: List<String>.from(json['tags']),
      rarity: json['rarity'],
      isUnlocked: json['isUnlocked'] ?? false,
      userPhotoPath: json['userPhotoPath'],
      unlockedAt: json['unlockedAt'] != null 
          ? DateTime.parse(json['unlockedAt']) 
          : null,
    );
  }

  Color get rarityColor {
    switch (rarity) {
      case 'legendary':
        return const Color(0xFFFFD700);
      case 'rare':
        return const Color(0xFF9B59B6);
      case 'common':
      default:
        return const Color(0xFF95A5A6);
    }
  }

  String get rarityLabel {
    switch (rarity) {
      case 'legendary':
        return 'LEGENDARNE';
      case 'rare':
        return 'RZADKIE';
      case 'common':
      default:
        return 'ZWYKŁE';
    }
  }
}

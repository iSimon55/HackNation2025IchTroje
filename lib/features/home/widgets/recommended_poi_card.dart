import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/models/poi.dart';

class RecommendedPOICard extends StatefulWidget {
  final POI poi;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const RecommendedPOICard({
    super.key,
    required this.poi,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  State<RecommendedPOICard> createState() => _RecommendedPOICardState();
}

class _RecommendedPOICardState extends State<RecommendedPOICard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.large),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.large),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.poi.images.first,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.backgroundGray,
                  child: const Icon(Icons.image, size: 48),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.m),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.poi.name,
                        style: AppTextStyles.h2.copyWith(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.8),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildTags(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: AppSpacing.m,
              right: AppSpacing.m,
              child: _buildFavoriteButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTags() {
    final tags = widget.poi.tags.take(3).toList();
    tags.add(widget.poi.getDistance());

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.large),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(AppRadius.large),
          ),
          child: Text(
            tags.join(' • '),
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.large),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(AppRadius.large),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
          onTap: widget.onFavoriteToggle,
          borderRadius: BorderRadius.circular(AppRadius.large),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.poi.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.poi.isFavorite ? AppColors.error : Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
        ),
      ),
    );
  }
}

import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<bool> requestPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  static Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await requestPermission();
      if (!hasPermission) {
        return null;
      }

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return null;
    }
  }

  static double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }

  static String formatDistance(double distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters.round()} m';
    } else {
      final km = distanceInMeters / 1000;
      return '${km.toStringAsFixed(1)} km';
    }
  }

  static Future<String?> getDistanceToPoint(
    double targetLatitude,
    double targetLongitude,
  ) async {
    final position = await getCurrentPosition();
    if (position == null) {
      return null;
    }

    final distance = calculateDistance(
      position.latitude,
      position.longitude,
      targetLatitude,
      targetLongitude,
    );

    return formatDistance(distance);
  }

  static Future<bool> isWithinRange(
    double targetLatitude,
    double targetLongitude,
    double rangeInMeters,
  ) async {
    final position = await getCurrentPosition();
    if (position == null) {
      return false;
    }

    final distance = calculateDistance(
      position.latitude,
      position.longitude,
      targetLatitude,
      targetLongitude,
    );

    return distance <= rangeInMeters;
  }

  static Future<double?> getDistanceInMeters(
    double targetLatitude,
    double targetLongitude,
  ) async {
    final position = await getCurrentPosition();
    if (position == null) {
      return null;
    }

    return calculateDistance(
      position.latitude,
      position.longitude,
      targetLatitude,
      targetLongitude,
    );
  }
}

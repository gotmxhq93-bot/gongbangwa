import 'package:flutter/foundation.dart';

class FavoritesStore {
  // 앱 안에서 찜 목록을 함께 사용하기 위한 저장소
  static final ValueNotifier<List<Map<String, dynamic>>> favorites =
      ValueNotifier<List<Map<String, dynamic>>>([]);

  static bool isFavorite(String workshopName) {
    return favorites.value.any(
      (workshop) => workshop['name'] == workshopName,
    );
  }

  static void toggleFavorite(Map<String, dynamic> workshop) {
    final updated = List<Map<String, dynamic>>.from(favorites.value);

    final index = updated.indexWhere(
      (item) => item['name'] == workshop['name'],
    );

    if (index >= 0) {
      updated.removeAt(index);
    } else {
      updated.add(workshop);
    }

    favorites.value = updated;
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStore {
  static const String _storageKey = 'favorite_workshops';

  static final ValueNotifier<List<Map<String, dynamic>>> favorites =
      ValueNotifier<List<Map<String, dynamic>>>([]);

  // 앱을 시작할 때 저장된 찜 목록 불러오기
  static Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedData = prefs.getString(_storageKey);

      if (savedData == null) {
        favorites.value = [];
        return;
      }

      final decoded = jsonDecode(savedData) as List<dynamic>;

      favorites.value = decoded.map((item) {
        return Map<String, dynamic>.from(item as Map);
      }).toList();

      debugPrint('❤️ 저장된 찜 ${favorites.value.length}개 불러오기 완료');
    } catch (error) {
      debugPrint('찜 목록 불러오기 실패: $error');
    }
  }

  // 특정 공방을 찜했는지 확인
  static bool isFavorite(String workshopName) {
    return favorites.value.any(
      (workshop) => workshop['name'] == workshopName,
    );
  }

  // 찜 추가 또는 해제
  static Future<void> toggleFavorite(
    Map<String, dynamic> workshop,
  ) async {
    final updated =
        List<Map<String, dynamic>>.from(favorites.value);

    final index = updated.indexWhere(
      (item) => item['name'] == workshop['name'],
    );

    if (index >= 0) {
      updated.removeAt(index);
      debugPrint('❤️ 찜 해제: ${workshop['name']}');
    } else {
      updated.add(workshop);
      debugPrint('❤️ 찜 추가: ${workshop['name']}');
    }

    // 화면에 즉시 반영
    favorites.value = updated;

    // 휴대폰에 저장
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = jsonEncode(updated);
      final saved = await prefs.setString(_storageKey, encoded);

      if (saved) {
        debugPrint('❤️ 찜 목록 저장 완료!');
      } else {
        debugPrint('찜 목록 저장 실패');
      }
    } catch (error) {
      debugPrint('찜 목록 저장 중 오류: $error');
    }
  }
}

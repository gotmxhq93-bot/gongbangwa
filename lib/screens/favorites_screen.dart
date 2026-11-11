
import 'package:flutter/material.dart';
import '../favorites_store.dart';
import 'workshop_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Map<String, dynamic>>>(
      valueListenable: FavoritesStore.favorites,
      builder: (context, favorites, child) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              '찜한 공방 ❤️',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '총 ${favorites.length}개의 공방을 찜했어요!',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            if (favorites.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 70,
                      color: Color(0xFF2478D4),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '아직 찜한 공방이 없어요!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '공방 상세 화면에서 하트를 눌러보세요 ❤️',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

            ...favorites.map((workshop) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                color: Colors.white,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: Container(
                    width: 55,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF4FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      workshop['icon'] as String,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                  title: Text(
                    workshop['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${workshop['location']}\n'
                    '${workshop['price']}원',
                  ),
                  isThreeLine: true,
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkshopDetailScreen(
                          workshop: workshop,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        );
      },
    );
  }
}


import 'package:flutter/material.dart';

class WorkshopDetailScreen extends StatefulWidget {
  final Map<String, dynamic> workshop;

  const WorkshopDetailScreen({
    super.key,
    required this.workshop,
  });

  @override
  State<WorkshopDetailScreen> createState() =>
      _WorkshopDetailScreenState();
}

class _WorkshopDetailScreenState extends State<WorkshopDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final workshop = widget.workshop;
    final name = workshop['name'] as String;
    final category = workshop['category'] as String;
    final location = workshop['location'] as String;
    final className = workshop['className'] as String;
    final price = workshop['price'] as int;
    final emoji = workshop['icon'] as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('공방 상세'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite
                        ? '찜 목록에 추가했어요 ❤️'
                        : '찜을 해제했어요',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8FBFF),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 210,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 90),
            ),
          ),
          const SizedBox(height: 24),

          Text(
            name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            '$category · $location',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 28),

          const Text(
            '클래스 소개',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Text(
            '$className\n\n'
            '처음 참여하는 분들도 편하게 즐길 수 있는 '
            '원데이 클래스입니다.\n'
            '나만의 특별한 작품을 만들어 보세요!',
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),

          const Text(
            '클래스 가격',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            '${price.toString()}원',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2478D4),
            ),
          ),
          const SizedBox(height: 32),

          SizedBox(
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('예약 기능은 곧 연결할 예정이에요! 📅'),
                  ),
                );
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text(
                '예약하러 가기',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2478D4),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = '전체';

  final List<String> categories = [
    '전체',
    '🏺 도자기·공예',
    '🧴 향수·뷰티',
    '💍 주얼리·액세서리',
    '👜 가죽·목공',
    '🧁 베이킹·디저트',
    '🎨 미술·드로잉',
    '💐 꽃·식물',
    '🕯️ 캔들·방향제',
    '🧶 뜨개·패브릭',
    '☕ 커피·음료',
    '🧼 비누·바디케어',
    '💻 디지털·창작',
    '📷 사진·콘텐츠',
    '🍳 요리·푸드크래프트',
    '🏠 인테리어·홈데코',
    '🐾 반려동물·펫크래프트',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          '공방 찾기 🔎',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: '공방명, 클래스명 검색',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: const Color(0xFFF2F7FD),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          '카테고리',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: categories.map((category) {
            return ChoiceChip(
              label: Text(category),
              selected: selectedCategory == category,
              onSelected: (_) {
                setState(() {
                  selectedCategory = category;
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 28),
        const Text(
          '선택한 카테고리',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(selectedCategory),
        const SizedBox(height: 20),
        const Text(
          '실제 공방 목록은 다음 단계에서 연결할 예정이에요.',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

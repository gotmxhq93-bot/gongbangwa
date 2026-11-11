
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = '전체';
  String searchText = '';

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

  final List<Map<String, dynamic>> workshops = [
    {
      'name': '몽글 도자기 공방',
      'category': '🏺 도자기·공예',
      'location': '서울 성수',
      'className': '나만의 머그컵 만들기',
      'price': 35000,
      'icon': '🏺',
    },
    {
      'name': '달콤 베이킹 스튜디오',
      'category': '🧁 베이킹·디저트',
      'location': '서울 홍대',
      'className': '미니 케이크 만들기',
      'price': 42000,
      'icon': '🧁',
    },
    {
      'name': '꽃담 플라워 공방',
      'category': '💐 꽃·식물',
      'location': '서울 연남',
      'className': '나만의 꽃다발 만들기',
      'price': 39000,
      'icon': '💐',
    },
    {
      'name': '향기로운 하루',
      'category': '🧴 향수·뷰티',
      'location': '서울 강남',
      'className': '나만의 시그니처 향수 만들기',
      'price': 48000,
      'icon': '🧴',
    },
    {
      'name': '반짝 주얼리 스튜디오',
      'category': '💍 주얼리·액세서리',
      'location': '서울 종로',
      'className': '은반지 만들기',
      'price': 55000,
      'icon': '💍',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredWorkshops = workshops.where((workshop) {
      final matchesCategory =
          selectedCategory == '전체' ||
          workshop['category'] == selectedCategory;

      final keyword = searchText.trim().toLowerCase();

      final matchesSearch =
          workshop['name'].toString().toLowerCase().contains(keyword) ||
          workshop['className'].toString().toLowerCase().contains(keyword);

      return matchesCategory && matchesSearch;
    }).toList();

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
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
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

        Text(
          '공방 목록 (${filteredWorkshops.length}개)',
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),

        if (filteredWorkshops.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text('검색 결과가 없어요 🥲'),
            ),
          ),

        ...filteredWorkshops.map((workshop) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF4FF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      workshop['icon'],
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workshop['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${workshop['category']} · ${workshop['location']}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(workshop['className']),
                        const SizedBox(height: 6),
                        Text(
                          '${workshop['price']}원',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2478D4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

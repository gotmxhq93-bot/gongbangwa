
import 'package:flutter/material.dart';

void main() {
  runApp(const GongbangwaApp());
}

class GongbangwaApp extends StatelessWidget {
  const GongbangwaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '공방와',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2478D4),
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '공방와',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2478D4),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            '오늘은 어떤 공방에 가볼까요?',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '나에게 딱 맞는 원데이 클래스를 찾아보세요.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4FF),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🎨 새로운 취미를 발견해 보세요!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('도자기부터 향수, 베이킹까지'),
                Text('공방와에서 특별한 하루를 만나보세요.'),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            '인기 카테고리',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Wrap(
            spacing: 10,
            runSpacing: 12,
            children: [
              Chip(label: Text('🏺 도자기')),
              Chip(label: Text('🧴 향수')),
              Chip(label: Text('💍 반지')),
              Chip(label: Text('🧁 베이킹')),
              Chip(label: Text('🎨 미술')),
              Chip(label: Text('💐 꽃')),
              Chip(label: Text('🕯️ 캔들')),
              Chip(label: Text('🧶 뜨개')),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            '같이 가요 👥',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Card(
            child: ListTile(
              leading: Icon(
                Icons.groups,
                color: Color(0xFF2478D4),
              ),
              title: Text('함께 원데이 클래스 갈 사람?'),
              subtitle: Text('같이 취미를 즐길 친구를 찾아보세요!'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: '공방 찾기',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            label: '같이 가요',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: '찜',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: '마이',
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'screens/search_screen.dart';
import 'screens/favorites_screen.dart';

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
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    SearchScreen(),
    SimplePage(
      title: '같이 가요',
      description: '함께 원데이 클래스를 갈 친구를 찾아보세요!',
      icon: Icons.groups_outlined,
    ),
    FavoritesScreen(),
    SimplePage(
      title: '마이페이지',
      description: '내 예약과 계정 정보를 확인해 보세요!',
      icon: Icons.person_outline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '공방와',
          style: TextStyle(
            color: Color(0xFF2478D4),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
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
            selectedIcon: Icon(Icons.favorite),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const SimplePage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: const Color(0xFF2478D4),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

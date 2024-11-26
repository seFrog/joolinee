import 'package:flutter/material.dart';
import '../explore/explore_page.dart';
import '../investment/investment_page.dart';
import '../me/my_page.dart';
import '../quiz/quiz_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  final List<Widget> _pages = const [
    QuizPage(),
    InvestmentPage(),
    Center(
      child: Text(
        '홈 화면',
        style: TextStyle(fontSize: 24),
      ),
    ),
    ExplorePage(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 2 ? '홈' : '페이지'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: '퀴즈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: '투자',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: '탐색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 정보',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'my_info.dart'; // 내 정보 페이지 import
import 'settings.dart'; // 설정 페이지 import

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // "내 정보" 버튼을 누르면 my_info.dart로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyInfoPage()),
                );
              },
              child: const Text('내 정보 보기'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // "설정" 버튼을 누르면 settings.dart로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              icon: const Icon(Icons.settings), // 톱니바퀴 아이콘
              label: const Text('설정'),
            ),
          ],
        ),
      ),
    );
  }
}

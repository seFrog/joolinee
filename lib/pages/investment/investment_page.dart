import 'package:flutter/material.dart';
import 'investment_detail.dart';

class InvestmentPage extends StatelessWidget {
  const InvestmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    int totalPoints = 5000; // 예시로 총 포인트 설정

    return Scaffold(
      appBar: AppBar(
        title: const Text('투자 페이지'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '총 포인트: $totalPoints',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InvestmentDetailPage()),
                );
              },
              child: const Text('내 투자 목록/정보'),
            ),
          ],
        ),
      ),
    );
  }
}

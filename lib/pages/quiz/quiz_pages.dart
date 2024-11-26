import 'package:flutter/material.dart';
import 'quiz_history.dart'; // 퀴즈 기록 페이지 import
import '../me/my_info.dart'; // 관심 카테고리 수정 페이지 import

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘의 퀴즈'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '정답 맞히고 포인트 받으세요',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '신용 깜짝 퀴즈',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '보험비 미납하면 신용점수가 떨어진다?',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // 정답 처리 로직 (예: 포인트 지급)
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text('정답!'),
                                content: Text('포인트 100점을 획득하셨습니다!'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Text('O'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // 오답 처리 로직
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text('오답!'),
                                content: Text('포인트는 깎이지 않습니다. 다시 도전하세요!'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text('X'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuizHistoryPage()),
                );
              },
              child: const Text('퀴즈 기록 보기'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyInfoPage()),
                );
              },
              child: const Text('관심 카테고리 수정'),
            ),
          ],
        ),
      ),
    );
  }
}

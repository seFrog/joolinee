import 'package:flutter/material.dart';

class QuizHistoryPage extends StatelessWidget {
  const QuizHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('퀴즈 기록'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            '날짜를 선택하여 퀴즈 기록을 확인하세요.',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 7, // 최근 7일 예시
              itemBuilder: (context, index) {
                final date = DateTime.now().subtract(Duration(days: index));
                final isQuizSolved = index % 2 == 0; // 예시: 짝수날에 퀴즈를 풀었다고 가정
                return ListTile(
                  title: Text('${date.month}월 ${date.day}일'),
                  subtitle: isQuizSolved
                      ? Text('맞춘 퀴즈 - 포인트: ${100 + index * 10}')
                      : const Text('이 날은 퀴즈를 풀지 않았어요.'),
                  onTap: () {
                    // 퀴즈 기록 조회 시 상세 내용 표시
                    if (isQuizSolved) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('${date.month}월 ${date.day}일'),
                          content: Text('맞춘 퀴즈\n포인트: ${100 + index * 10}'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('닫기'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

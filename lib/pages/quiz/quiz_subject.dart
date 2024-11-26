import 'package:flutter/material.dart';

class QuizSubjectPage extends StatelessWidget {
  const QuizSubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시 데이터: 뉴스 리스트
    final List<Map<String, String>> newsList = [
      {
        'title': '리비안, 테슬라와의 \'20년 소송 조건 부 합의로 랠리',
        'source': '연합뉴스',
        'time': '9시간 전',
        'thumbnail': 'https://via.placeholder.com/150/FF5733/FFFFFF', // 썸네일 URL
      },
      {
        'title': '테슬라 주가 35% 하락 경고, 머스크의 반박에도 투자자 불안 증폭',
        'source': 'theterminalx.com',
        'time': '8시간 전',
        'thumbnail': 'https://via.placeholder.com/150/00BFFF/FFFFFF',
      },
      {
        'title': '테슬라, 캘리포니아주 신규 전기차 보조금 대상에서 제외될 수 있어',
        'source': '연합뉴스',
        'time': '1시간 전',
        'thumbnail': 'https://via.placeholder.com/150/FFC300/FFFFFF',
      },
      {
        'title': 'UBS "테슬라, 야성적 충동에 의해 움직여… 매도 유지"',
        'source': '연합뉴스',
        'time': '3시간 전',
        'thumbnail': 'https://via.placeholder.com/150/DAF7A6/FFFFFF',
      },
      {
        'title': 'Tesla, 캘리포니아 신형 전기차 세액 공제 제외 가능성',
        'source': '로이터',
        'time': '9시간 전',
        'thumbnail': 'https://via.placeholder.com/150/FF5733/FFFFFF',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('테슬라 뉴스'), // 주식 이름
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '관련 뉴스',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final news = newsList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Image.network(
                        news['thumbnail']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        news['title']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        '${news['time']} · ${news['source']}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      onTap: () {
                        // 뉴스 클릭 시 동작 (예: 웹뷰로 이동)
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(news['title']!),
                            content: const Text('이 뉴스를 읽으시겠습니까?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('닫기'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

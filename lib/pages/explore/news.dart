import 'package:flutter/material.dart';
import '../me/my_info.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> topNews = [
      {
        'title': '테슬라, 35% 하락 경고에 투자자 긴장',
        'source': '연합뉴스',
        'time': '3시간 전',
        'thumbnail': 'https://via.placeholder.com/150/FF5733/FFFFFF',
      },
      {
        'title': '인공지능, 의료 분야 혁신 가속화',
        'source': '로이터',
        'time': '2시간 전',
        'thumbnail': 'https://via.placeholder.com/150/00BFFF/FFFFFF',
      },
      {
        'title': '애플, 새로운 MR 헤드셋 출시 임박',
        'source': '연합뉴스',
        'time': '5시간 전',
        'thumbnail': 'https://via.placeholder.com/150/FFC300/FFFFFF',
      },
      // 더 많은 뉴스 추가 가능
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('뉴스'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Top 10 뉴스',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: topNews.length,
              itemBuilder: (context, index) {
                final news = topNews[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
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
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    onTap: () {
                      // 뉴스 클릭 시 동작
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyInfoPage()),
                );
              },
              child: const Text('관심 카테고리 수정'),
            ),
          ),
        ],
      ),
    );
  }
}

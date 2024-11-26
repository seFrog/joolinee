import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stocks = [
      {'name': '테슬라', 'price': '900 USD'},
      {'name': '애플', 'price': '150 USD'},
      {'name': '구글', 'price': '2800 USD'},
      {'name': '아마존', 'price': '3400 USD'},
      // 더 많은 주식 추가 가능
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('모든 주식'),
      ),
      body: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          final stock = stocks[index];
          return ListTile(
            title: Text(
              stock['name']!,
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text('현재 가격: ${stock['price']}'),
            onTap: () {
              // 주식 클릭 시 동작
            },
          );
        },
      ),
    );
  }
}

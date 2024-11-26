import 'package:flutter/material.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({super.key});

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  final int _userPoints = 1000; // 사용자 포인트 예시
  final List<String> _categories = ['인공지능', '컴퓨터', '자동차', '금융', '헬스케어'];
  final Map<String, bool> _selectedCategories = {}; // 선택된 카테고리 저장

  @override
  void initState() {
    super.initState();
    // 카테고리 초기화 (모두 선택 안됨)
    for (var category in _categories) {
      _selectedCategories[category] = false;
    }
  }

  void _saveCategories() {
    // 선택된 카테고리만 추출
    List<String> selected = _selectedCategories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    // 저장 후 사용자에게 알림
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('저장 완료'),
        content: Text('선택된 카테고리: ${selected.join(', ')}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 포인트 표시
            Text(
              '보유 포인트: $_userPoints',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              '관심 있는 카테고리를 선택하세요:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: _categories.map((category) {
                  return CheckboxListTile(
                    title: Text(category),
                    value: _selectedCategories[category],
                    onChanged: (value) {
                      setState(() {
                        _selectedCategories[category] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: _saveCategories,
              child: const Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}

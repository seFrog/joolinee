import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InvestmentDetailPage extends StatefulWidget {
  const InvestmentDetailPage({super.key});

  @override
  State<InvestmentDetailPage> createState() => _InvestmentDetailPageState();
}

class _InvestmentDetailPageState extends State<InvestmentDetailPage> {
  String _selectedRange = '1일'; // 기본 그래프 범위

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('투자 상세 정보'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '투자 주식 목록',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('테슬라'),
              subtitle: const Text('현재 가격: 900 USD'),
              trailing: const Text('보유: 5주'),
              onTap: () {
                // 상세 정보를 클릭하면 동작
              },
            ),
            const Divider(),
            const Text(
              '주식 차트',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRangeButton('1일'),
                _buildRangeButton('1주일'),
                _buildRangeButton('1달'),
                _buildRangeButton('1년'),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: _generateMockData(), // 그래프 데이터
                      isCurved: true,
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.lightBlueAccent],
                      ),
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 매수 동작
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text('매수'),
                        content: Text('매수 기능이 호출되었습니다.'),
                      ),
                    );
                  },
                  child: const Text('매수'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 매도 동작
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Text('매도'),
                        content: Text('매도 기능이 호출되었습니다.'),
                      ),
                    );
                  },
                  child: const Text('매도'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 그래프 범위를 변경하는 버튼 위젯
  Widget _buildRangeButton(String range) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedRange = range;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedRange == range ? Colors.blue : Colors.grey,
      ),
      child: Text(range),
    );
  }

  // Mock 데이터 생성
  List<FlSpot> _generateMockData() {
    // 범위에 따라 다른 데이터 제공 (간단한 예시)
    switch (_selectedRange) {
      case '1주일':
        return [
          const FlSpot(0, 900),
          const FlSpot(1, 920),
          const FlSpot(2, 910),
          const FlSpot(3, 940),
          const FlSpot(4, 930),
          const FlSpot(5, 950),
          const FlSpot(6, 960),
        ];
      case '1달':
        return [
          const FlSpot(0, 870),
          const FlSpot(1, 880),
          const FlSpot(2, 890),
          const FlSpot(3, 900),
          const FlSpot(4, 910),
          const FlSpot(5, 920),
          const FlSpot(6, 930),
          const FlSpot(7, 940),
          const FlSpot(8, 950),
          const FlSpot(9, 960),
          const FlSpot(10, 970),
          const FlSpot(11, 980),
        ];
      case '1년':
        return [
          const FlSpot(0, 800),
          const FlSpot(1, 820),
          const FlSpot(2, 850),
          const FlSpot(3, 870),
          const FlSpot(4, 900),
          const FlSpot(5, 930),
          const FlSpot(6, 960),
          const FlSpot(7, 970),
          const FlSpot(8, 980),
          const FlSpot(9, 1000),
        ];
      default: // '1일'
        return [
          const FlSpot(0, 900),
          const FlSpot(1, 905),
          const FlSpot(2, 910),
          const FlSpot(3, 915),
          const FlSpot(4, 920),
        ];
    }
  }
}

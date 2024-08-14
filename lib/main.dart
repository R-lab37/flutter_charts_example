import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Line Chart Example')),
        body: CombinedChart(),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey),
        ),
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 1),
              FlSpot(2, 4),
              FlSpot(3, 3),
              FlSpot(4, 5),
              FlSpot(5, 2),
              FlSpot(6, 4),
            ],
            isCurved: true, // Make the line curve
            color: Colors.amber[100], // Line color
            belowBarData: BarAreaData(
                show: true, color: Colors.red[100]), // Area under the line
            dotData: FlDotData(show: true), // Show dots on the line
          )
        ]));
  }
}

class MultiLineChart extends StatelessWidget {
  const MultiLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multi-Line Chart')),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true),
              titlesData: const FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
              ),
              borderData: FlBorderData(show: true),
              minX: 0,
              maxX: 6,
              minY: 18,
              maxY: 32,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 23),
                    FlSpot(1, 25),
                    FlSpot(2, 28),
                    FlSpot(3, 30),
                    FlSpot(4, 27),
                    FlSpot(5, 24),
                    FlSpot(6, 22),
                  ],
                  isCurved: true,
                  color: Colors.amberAccent[300],
                  belowBarData: BarAreaData(
                      show: true, color: Colors.green.withOpacity(1.0)),
                  dotData: FlDotData(show: true),
                ),
                LineChartBarData(
                  spots: [
                    FlSpot(0, 20),
                    FlSpot(1, 22),
                    FlSpot(2, 26),
                    FlSpot(3, 29),
                    FlSpot(4, 25),
                    FlSpot(5, 23),
                    FlSpot(6, 21),
                  ],
                  isCurved: true,
                  color: Colors.blue[100],
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          )),
    );
  }
}

class BarChartExample extends StatelessWidget {
  const BarChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales Bar Chart')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            gridData: const FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    const productNames = [
                      'Product 1',
                      'Product 2',
                      'Product 3',
                      'Product 4',
                      'Product 5',
                      'Product 6'
                    ];
                    return Text(productNames[value.toInt()]);
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: true),
            barGroups: [
              BarChartGroupData(
                  x: 0,
                  barRods: [BarChartRodData(toY: 10, color: Colors.blue)]),
              BarChartGroupData(
                  x: 1, barRods: [BarChartRodData(toY: 15, color: Colors.red)]),
              BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(toY: 20, color: Colors.green)]),
              BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(toY: 5, color: Colors.yellow)]),
              BarChartGroupData(
                  x: 4,
                  barRods: [BarChartRodData(toY: 12, color: Colors.purple)]),
              BarChartGroupData(
                  x: 5,
                  barRods: [BarChartRodData(toY: 8, color: Colors.orange)]),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpensesPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expenses Pie Chart')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(value: 40, title: 'Rent', color: Colors.blue),
              PieChartSectionData(
                  value: 20, title: 'Groceries', color: Colors.green),
              PieChartSectionData(
                  value: 15, title: 'Entertainment', color: Colors.red),
              PieChartSectionData(
                  value: 15, title: 'Utilities', color: Colors.orange),
              PieChartSectionData(
                  value: 10, title: 'Savings', color: Colors.purple),
            ],
            sectionsSpace: 0,
            centerSpaceRadius: 40,
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}

class CombinedChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Combined Chart')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true, getTitlesWidget: bottomTitleWidgets),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
            ),
            borderData: FlBorderData(show: true),
            minX: 0,
            maxX: 5,
            minY: 0,
            maxY: 220,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 50),
                  FlSpot(1, 70),
                  FlSpot(2, 90),
                  FlSpot(3, 60),
                  FlSpot(4, 110),
                  FlSpot(5, 130),
                ],
                isCurved: true,
                barWidth: 4,
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Jan', style: style);
        break;
      case 1:
        text = Text('Feb', style: style);
        break;
      case 2:
        text = Text('Mar', style: style);
        break;
      case 3:
        text = Text('Apr', style: style);
        break;
      case 4:
        text = Text('May', style: style);
        break;
      case 5:
        text = Text('Jun', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: text,
    );
  }
}

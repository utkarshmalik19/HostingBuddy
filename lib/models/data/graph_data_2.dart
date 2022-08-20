import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphData2 extends StatefulWidget {
  const GraphData2({Key? key}) : super(key: key);

  @override
  State<GraphData2> createState() => _GraphData2State();
}

class _GraphData2State extends State<GraphData2> {
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
        fontSize: 10,
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      );
      String text;

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 4,
        child: Text("", style: style),
      );
    }

    Widget leftTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(fontSize: 10);

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          '',
          style: style,
        ),
      );
    }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 0.61,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 5),
                FlSpot(1, 3.5),
                FlSpot(2, 4),
                FlSpot(3.3, 3.5),
                FlSpot(3.8, 4.2),
                FlSpot(4.4, 3.5),
                FlSpot(5.4, 3.2),
                FlSpot(7, 3),
                FlSpot(8, 2.5),
                FlSpot(9, 2.2),
                FlSpot(9.5, 2),
                FlSpot(11, 1.9),
              ],
              isCurved: true,
              color: Colors.green,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    stops: [0, 1],
                    colors: [
                      Color(0xffFFFFFF),
                      Color(0xffEAF7FB)
                    ],
                  )),
            ),
            LineChartBarData(
              spots: const [
                FlSpot(0, 2),
                FlSpot(1, 3),
                FlSpot(2, 2),
                FlSpot(3, 1.5),
                FlSpot(4, 2),
                FlSpot(5, 3),
                FlSpot(6, 3.5),
                FlSpot(7, 4),
                FlSpot(8, 4),
                FlSpot(9, 5),
                FlSpot(10, 4.2),
                FlSpot(11, 6),
              ],
              isCurved: true,
              barWidth: 2,
              color: Colors.blue,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    stops: [0, 1],
                    colors: [
                      Color(0xffFFFFFF),
                      Color(0xffEAF7FB)
                    ],
                  )),
            ),
            LineChartBarData(
                spots: const [
                  FlSpot(0, 2),
                  FlSpot(1, 3),
                  FlSpot(2, 4),
                  FlSpot(3, 5),
                  FlSpot(4, 8),
                  FlSpot(5, 3),
                  FlSpot(6, 5),
                  FlSpot(7, 8),
                  FlSpot(8, 4),
                  FlSpot(9, 7),
                  FlSpot(10, 7),
                  FlSpot(11, 0),
                ],
                barWidth: 0,
                shadow: null,
                showingIndicators: null,
                isCurved: true,
                color: Colors.transparent),
          ],
          betweenBarsData: [
            BetweenBarsData(
              fromIndex: 0,
              toIndex: 1,
              color: Colors.transparent,
            ),
          ],
          minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                // showTitles: true,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                getTitlesWidget: leftTitleWidgets,
                interval: 1,
                reservedSize: 36,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            drawVerticalLine: false,
            drawHorizontalLine: false,
            horizontalInterval: 1,
            checkToShowHorizontalLine: (double value) {
              return value == 1 ||
                  value == 6 ||
                  value == 4 ||
                  value == 5;
            },
          ),
        ),
      ),
    );
  }
}

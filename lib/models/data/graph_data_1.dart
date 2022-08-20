import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphData1 extends StatefulWidget {
  var color, color1, color2, color3, color4;

  GraphData1(
      {required this.color,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.color4});

  @override
  State<GraphData1> createState() => _GraphData1State();
}

class _GraphData1State extends State<GraphData1> {
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
    return Expanded(
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 2),
                FlSpot(1, 3.5),
                FlSpot(2, 2.5),
                FlSpot(3.3, 3.5),
                FlSpot(3.8, 4.5),
                FlSpot(4.4, 5),
                FlSpot(5.4, 5.5),
                FlSpot(7, 5.8),
                FlSpot(8, 5.3),
                FlSpot(9, 6),
                FlSpot(9.5, 6.5),
                FlSpot(11, 7),
              ],
              isCurved: true,
              color: Color(widget.color),
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    stops: [0, 0.18, 0.32, 0.5],
                    colors: [
                      Color(widget.color1),
                      Color(widget.color2),
                      Color(widget.color3),
                      Color(widget.color4)
                    ],
                  )),
            ),
            LineChartBarData(
                spots: const [
                  FlSpot(0, 0),
                  FlSpot(1, 0),
                  FlSpot(2, 0),
                  FlSpot(3.3, 0),
                  FlSpot(3.8, 0),
                  FlSpot(4.4, 0),
                  FlSpot(5.4, 0),
                  FlSpot(7, 0),
                  FlSpot(8, 0),
                  FlSpot(9, 0),
                  FlSpot(9.5, 0),
                  FlSpot(11, 0),
                ],
                barWidth: 0,
                shadow: null,
                showingIndicators: null,
                isCurved: true,
                color: Colors.transparent),
          ],

          // betweenBarsData: [
          //   BetweenBarsData(
          //     fromIndex: 0,
          //     toIndex: 1,
          //     color: Color(0xffB9AEF7)
          //         .withOpacity(0.05),
          //   ),
          // ],
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
              return value == 1 || value == 6 || value == 4 || value == 5;
            },
          ),
        ),
      ),
    );
  }
}

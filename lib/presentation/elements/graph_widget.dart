import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class GraphWidget extends StatefulWidget {
  //const GraphWidget({Key? key}) : super(key: key);
// List<double> xData = [3,3.5,4.5,4,4.5,5,6];
 List <double> yData;
List <String> xData;
  GraphWidget({
  required this.xData,
 required this.yData});
  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  List<double> yData = [3,3.5,4.5,4,4.5,5,6];
  List<String> xData = ['Jun 01','June 02', 'June 03','June 04','June 05','June 06','June 07',];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      color: Color(0xff1A191E),

    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = xData[0];
        break;
      case 1:
        text = xData[1];
        break;
      case 2:
        text = xData[2];
        break;
      case 3:
        text = xData[3];
        break;
      case 4:
        text = xData[4];
        break;
      case 5:
        text = xData[5];
        break;
      case 6:
        text = xData[6];
        break;

      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        ' ${(value*50).toInt()}',
        style: style,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.8,
      child: Padding(
        padding: const EdgeInsets.only(left: 17, right: 37),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),

            lineBarsData: [
              LineChartBarData(
                spots:  [
                  FlSpot(0, yData[0]),
                  FlSpot(1,yData[1]),
                  FlSpot(2, yData[2]),
                  FlSpot(3, yData[3]),
                  FlSpot(4, yData[4]),
                  FlSpot(5, yData[5]),
                  FlSpot(6, yData[6]),

                ],
                belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      stops: [ 0.3,1],
                      colors: [
                        Color(0xffC2E3F2),
                        Color(0xffE7F0F4),

                      ],
                    )
                ),
                isCurved: true,
                barWidth: 1.5,
                color: Color(0xff86D3F6),
                dotData: FlDotData(
                  show: false,
                ),
              ),
              LineChartBarData(
                spots: const [
                  FlSpot(0, 2),
                  FlSpot(1, 2.5),
                  FlSpot(2, 3.5),
                  FlSpot(3, 3),
                  FlSpot(4, 4),
                  FlSpot(5, 4.5),
                  FlSpot(6, 5),

                ],
                belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      stops: [ 0.54,1],
                      colors: [
                        Color(0xffA9E39B),
                        Color(0xffEEFCEC),


                      ],
                    )
                ),
                isCurved: true,
                barWidth: 2,
                color: Color(0xff8DCD7E),
                dotData: FlDotData(
                  show: false,
                ),
              ),
              LineChartBarData(
                spots: const [
                  FlSpot(0, 1),
                  FlSpot(1, 2),
                  FlSpot(2, 3),
                  FlSpot(3, 2.5),
                  FlSpot(4, 3),
                  FlSpot(5, 3.5),
                  FlSpot(6, 4),

                ],
                isCurved: false,
                barWidth: 2,
                color: Color(0xff9C92E2),

                belowBarData: BarAreaData(
                    show: true,
                    gradient:
                    LinearGradient(

                      stops: [ 0,0,1],
                      colors: [
                        Color(0xff8F7EF3),
                        Color(0xffCCC4FA),
                        Color(0xffF3F1FF),



                      ],
                    )
                ),

                dotData: FlDotData(
                  show: false,
                ),
              ),
            ],
            borderData: FlBorderData(
              show: false,

            ),

            minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
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
            gridData: FlGridData(
              show: false,
              drawVerticalLine: true,
              horizontalInterval: 1,
              checkToShowHorizontalLine: (double value) {
                return value == 1 || value == 6 || value == 4 || value == 5;
              },
            ),
          ),
        ),
      ),
    );
  }
}

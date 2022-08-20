import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:scaffold/models/data/review_data.dart';

class DougnutChart extends StatefulWidget {
  final int index;
  final int happy;
  final int neutral;
  final int sad;
  DougnutChart(
      {required this.index, required this.happy, required this.neutral, required this.sad});

  @override
  State<DougnutChart> createState() => _DougnutChartState();
}

class _DougnutChartState extends State<DougnutChart> {
  int touchedIndex = -1;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 10,
      child: PieChart(PieChartData(
        pieTouchData:
            PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
          });
        }),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 35,
        sections: showingSections(ReviewData.review_list[widget.index].color),
      )),
    );
  }

  List<PieChartSectionData> showingSections(List<int> colors) {
    int j = -1;

    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;

      //final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 30.0 : 15.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xff74EDB3),
            value: widget.happy.toDouble(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 0,
                fontWeight: FontWeight.bold,
                color: Color(0xff74EDB3)),
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xffEED893),
            value: widget.neutral.toDouble(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 0,
                fontWeight: FontWeight.bold,
                color: const Color(0xffEED893)),
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xffF4977E),
            value: widget.sad.toDouble(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 0,
                fontWeight: FontWeight.bold,
                color: const Color(0xffF4977E)),
          );

        default:
          throw Error();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:scaffold/models/data/review_data.dart';

class DougnutChart2 extends StatefulWidget {
  final int progress;
  final int index;
  final Color color;
  DougnutChart2(
      {required this.progress, required this.color, required this.index});

  @override
  State<DougnutChart2> createState() => _DougnutChart2State();
}

class _DougnutChart2State extends State<DougnutChart2> {
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

    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;

      //final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 30.0 : 15.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: widget.color,
            value: widget.progress.toDouble(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 0,
                fontWeight: FontWeight.bold,
                color: widget.color),
          );
        case 1:

          var left = 100 - widget.progress;
          return PieChartSectionData(
            color: Colors.white,
            value: left.toDouble(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 0,
                fontWeight: FontWeight.bold,
                color:  Colors.white),
          );


        default:
          throw Error();
      }
    });
  }
}

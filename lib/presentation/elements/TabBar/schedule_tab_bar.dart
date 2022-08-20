import 'package:flutter/material.dart';


import '../../layouts/TabBarPages/schedule_tb.dart';





class ScheduleTabBar extends StatefulWidget {
  const ScheduleTabBar({Key? key}) : super(key: key);

  @override
  State<ScheduleTabBar> createState() => _ScheduleTabBarState();
}

class _ScheduleTabBarState extends State<ScheduleTabBar> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  initState() {
    super.initState();
    controller = TabController(length: 7, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {

    // String formattedDate = DateFormat('d').format(now);
    DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int today = date.day;

    int day = date.weekday;
    String dayOfWeek;
    var dayDate = new Map();
    dayDate[today] = day;
    if(day == 1){
      dayOfWeek = "mon";

    }else if(day == 2){
      dayOfWeek = "tue";

    }
    else if(day == 3){
      dayOfWeek = "wed";
    }
    else if(day == 4){
      dayOfWeek = "thu";
    }
    else if(day == 5){
      dayOfWeek = "fri";
    }
    else if(day == 6){
      dayOfWeek = "sat";
    }
    else
      dayOfWeek = "sun";

    return Column(
      children: [
        Container(
          height: 50,
          child: TabBar(
            labelColor: Color(0xff686E7D),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            controller: controller,
            tabs: <Widget>[
              Tab(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(today.toString(),style: TextStyle(color: Colors.black),),
                    ),
                    Text(dayOfWeek,style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text((today+1).toString(),style: TextStyle(color: Colors.black),),
                    ),
                    Text(dayOfWeek,style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text((today+2).toString(),style: TextStyle(color: Colors.black),),
                    ),
                    Text(dayOfWeek,style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text((today+3).toString(),style: TextStyle(color: Colors.black),),
                    ),
                    Text(dayOfWeek,style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text((today+4).toString(),style: TextStyle(color: Colors.black),),
                    ),
                    Text(dayOfWeek,style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text((today+5).toString(),style: TextStyle(color: Colors.black),),
                    ),
                    Text(dayOfWeek,style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text((today+6).toString(),style: TextStyle(color: Colors.black),),
                    ),
                    Text(dayOfWeek,style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
            ],
            indicator:
            CircleTabIndicator(color: Colors.grey, radius: 4),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.75,
          color: Colors.white,
          child: TabBarView(
              controller: controller,
              children: <Widget>[
                ScheduleTb(),
                ScheduleTb(),
                ScheduleTb(),
                ScheduleTb(),
                ScheduleTb(),
                ScheduleTb(),
                ScheduleTb(),
              ]),
        )
      ],
    );
  }
}
class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  // @override
  // BoxPainter createBoxPainter([VoidCallback onChanged]) {
  //   // TODO: implement createBoxPainter
  //   throw _CirclePainter(Colors.black, 10);
  // }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset((cfg.size?.width)! / 2, (cfg.size?.height)! - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

import '../../../models/data/revenue_data.dart';
import '../../layouts/TabBarPages/revenue_tb.dart';

class RevenueTabBar extends StatefulWidget {
  const RevenueTabBar({Key? key}) : super(key: key);

  @override
  State<RevenueTabBar> createState() => _RevenueTabBarState();
}

class _RevenueTabBarState extends State<RevenueTabBar>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppConstants().height * 0.07,
          child: TabBar(
            labelColor: Color(0xff686E7D),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            controller: controller,
            tabs: <Widget>[
              Tab(
                text: "Today",
              ),
              Tab(
                text: "Last Week",
              ),
              Tab(
                text: "Last Month",
              ),
              Tab(
                text: "Last Year",
              )
            ],
            indicator: CircleTabIndicator(color: Colors.grey, radius: 4),
          ),
        ),
        Expanded(
          child: TabBarView(controller: controller, children: <Widget>[
            RevenueTb(
              list: RevenueData.revenue_data[0],
            ),
            RevenueTb(
              list: RevenueData.revenue_data[1],
            ),
            RevenueTb(
              list: RevenueData.revenue_data[2],
            ),
            RevenueTb(
              list: RevenueData.revenue_data[3],
            ),
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

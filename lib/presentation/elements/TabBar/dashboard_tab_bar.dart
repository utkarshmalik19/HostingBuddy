import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

import '../../../models/data/bookings_data.dart';
import '../../../models/data/revenue_data.dart';
import '../../../models/data/review_data.dart';
import '../../layouts/TabBarPages/dashboard_tb.dart';

class TabBarMenu extends StatefulWidget {
  const TabBarMenu({Key? key}) : super(key: key);

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu>
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: V_LARGE_PAD_HOR,
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
            DashBoardTb(
                revenueGenerated: RevenueData.revenue_data[0].totalRevenue,
                revenueLost: RevenueData.revenue_data[0].revenueLost,
                reviews: [
                  ReviewData.review_list[0].reviews,
                  BookingsData.bookings_list[0].totalBookings
                ],
                reviewsExtra: [
                  15,
                  15
                ],
                color: [
                  0xff9D92E2,
                  0xff6EC4EB,
                  0xffF6C477
                ],
                qty: [
                  0.5,
                  0.6,
                  0.7
                ],
                title: [
                  'Availability Rate',
                  'Acceptance Rate',
                  'Response Rate'
                ],
                val: [
                  50,
                  60,
                  70
                ]),
            DashBoardTb(
                revenueGenerated: RevenueData.revenue_data[1].totalRevenue,
                revenueLost: RevenueData.revenue_data[1].revenueLost,
                reviews: [
                  ReviewData.review_list[1].reviews,
                  BookingsData.bookings_list[1].totalBookings
                ],
                reviewsExtra: [
                  15,
                  15
                ],
                color: [
                  0xff9D92E2,
                  0xff6EC4EB,
                  0xffF6C477
                ],
                qty: [
                  0.5,
                  0.6,
                  0.7
                ],
                title: [
                  'Availability Rate',
                  'Acceptance Rate',
                  'Response Rate'
                ],
                val: [
                  50,
                  60,
                  70
                ]),
            DashBoardTb(
                revenueGenerated: RevenueData.revenue_data[2].totalRevenue,
                revenueLost: RevenueData.revenue_data[2].revenueLost,
                reviews: [
                  ReviewData.review_list[2].reviews,
                  BookingsData.bookings_list[2].totalBookings
                ],
                reviewsExtra: [
                  15,
                  15
                ],
                color: [
                  0xff9D92E2,
                  0xff6EC4EB,
                  0xffF6C477
                ],
                qty: [
                  0.5,
                  0.6,
                  0.7
                ],
                title: [
                  'Availability Rate',
                  'Acceptance Rate',
                  'Response Rate'
                ],
                val: [
                  50,
                  60,
                  70
                ]),
            DashBoardTb(
                revenueGenerated: RevenueData.revenue_data[3].totalRevenue,
                revenueLost: RevenueData.revenue_data[3].revenueLost,
                reviews: [
                  ReviewData.review_list[3].reviews,
                  BookingsData.bookings_list[3].totalBookings
                ],
                reviewsExtra: [
                  15,
                  15
                ],
                color: [
                  0xff9D92E2,
                  0xff6EC4EB,
                  0xffF6C477
                ],
                qty: [
                  0.5,
                  0.6,
                  0.7
                ],
                title: [
                  'Availability Rate',
                  'Acceptance Rate',
                  'Response Rate'
                ],
                val: [
                  50,
                  60,
                  70
                ])
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

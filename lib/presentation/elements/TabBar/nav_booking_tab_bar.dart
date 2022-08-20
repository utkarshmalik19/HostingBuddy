import 'package:flutter/material.dart';
import 'package:scaffold/presentation/layouts/TabBarPages/bookings_tb.dart';

import '../../../utils/consts.dart';
import '../NavBookingsCard/cancelled_booking_page.dart';
import '../NavBookingsCard/confirmed_booking_page.dart';
import '../NavBookingsCard/requested_booking_page.dart';

class BookingsBar extends StatefulWidget {
  final String bookingType;
  const BookingsBar({Key? key, required this.bookingType}) : super(key: key);

  @override
  State<BookingsBar> createState() => _BookingsBarState();
}

class _BookingsBarState extends State<BookingsBar>
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
          height: AppConstants().height*0.059,
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
            BookingsTb(
              bookingType: widget.bookingType,
            ),
            BookingsTb(
              bookingType: widget.bookingType,
            ),
            BookingsTb(
              bookingType: widget.bookingType,
            ),
            BookingsTb(
              bookingType: widget.bookingType,
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

import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

import '../../../models/age_range_data.dart';
import '../../../models/revenue_model.dart';
import '../../elements/age_range.dart';
import '../../elements/graph_widget.dart';

class RevenueTb extends StatefulWidget {
  // const RevenueTb({Key? key}) : super(key: key);

  RevenueModel list;
  RevenueTb({
    required this.list,
  });
  @override
  State<RevenueTb> createState() => _RevenueTbState();
}

class _RevenueTbState extends State<RevenueTb> {
  List<String> groupType = ['Couple','Family','Friends'];
  List<int> groupSize = [1,2,3];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(
                    top: MEDIUM_PAD_VER, bottom: LARGE_PAD_VER, left: MEDIUM_PAD_HOR, right: V_SMALL_PAD_HOR),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Color(0xffF2F0DF))],
                      border: Border.all(color: Color(0xffF5BF70)),
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width * 0.37,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(bottom: VV_SMALL_PAD_VER, top: MEDIUM_PAD_2_VER),
                        child: Text(
                          "Total Revenue",
                          style: TextStyle(
                              color: Color(0xffF39D1B),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "₹${widget.list.totalRevenue}",
                        style: TextStyle(fontSize: MED_FONT_SIZE_2),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Color(0xffF3F1FF))],
                    border: Border.all(color: Color(0xff8F7EF3)),
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width * .37,
                height: MediaQuery.of(context).size.height * .12,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: VV_SMALL_PAD_VER, top: MEDIUM_PAD_2_VER),
                      child: Text(
                        "Revenue Lost",
                        style: TextStyle(
                            color: Color(0xff8F7EF3),
                            fontSize: REGULAR_FONT_SIZE,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppConstants().width*0.115),
                      child: Text("₹${widget.list.revenueLost}",
                          style: TextStyle(fontSize: MED_FONT_SIZE_2)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.height * 0.78,
              child: GraphWidget(
                  xData: widget.list.xdata, yData: widget.list.ydata)),
          Padding(
            padding:  EdgeInsets.only(top: AppConstants().height*0.056, bottom: VV_SMALL_PAD_VER, left: MEDIUM_PAD_2_HOR),
            child: Text("Age Range",
                style: TextStyle(fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                        child: Text(widget.list.range[index]),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: AppConstants().width*0.03),
                        child: Container(
                            height: MEDIUM_PAD_2_VER,
                            width: MediaQuery.of(context).size.width * 0.59,
                            child: AgeRange(
                                color: widget.list.color[index],
                                value: widget.list.val[index])),
                      ),
                      Text(widget.list.qty[index].toString()),
                    ],
                  );
                }),
          ),
          Padding(
            padding:  EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
            child: Text("Group Type",style: TextStyle(fontSize: MED_FONT_SIZE,fontWeight: FontWeight.bold)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),

                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                        child: Text(groupType[index]),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: AppConstants().width*0.03),
                        child: Container(height: MEDIUM_PAD_2_VER,
                            width: MediaQuery.of(context).size.width*0.59,
                            child: AgeRange(color: AgeRangeData.age_range_list[index].color,
                              value: AgeRangeData.age_range_list[index].val,)),
                      ),
                      Text(AgeRangeData.age_range_list[index].qty.toString())
                    ],
                  );
                }),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: VV_SMALL_PAD_VER,left: MEDIUM_PAD_2_HOR),
            child: Text("Group Size",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),

                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                        child: Text(groupSize[index].toString()),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: AppConstants().width*0.03),
                        child: Container(height: MEDIUM_PAD_2_VER,
                            width: MediaQuery.of(context).size.width*0.59,
                            child: AgeRange(color: AgeRangeData.age_range_list[index].color,
                              value: AgeRangeData.age_range_list[index].val,)),
                      ),
                      Text(AgeRangeData.age_range_list[index].qty.toString())
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

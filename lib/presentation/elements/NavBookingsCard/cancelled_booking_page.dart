import 'package:flutter/material.dart';

import '../../../utils/consts.dart';
import 'cancelled_booking_card.dart';

class CancelledBookingPage extends StatelessWidget {
  const CancelledBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: AppConstants().width*0.03,right: AppConstants().width*0.03,top: VV_SMALL_PAD_VER),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Cancelled By You",style: TextStyle(fontSize: LARGE_FONT_SIZE,fontWeight: FontWeight.bold),),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      child: CancelledBookingsCard(index: index,),
                    );
                  }),
              //Text(("Cancelled By You")),
              Padding(
                padding:  EdgeInsets.only(top: VV_SMALL_PAD_VER),
                child: Text("Cancelled By Guest",style: TextStyle(fontSize: LARGE_FONT_SIZE,fontWeight: FontWeight.bold),),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      child: CancelledBookingsCard(index: index,),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

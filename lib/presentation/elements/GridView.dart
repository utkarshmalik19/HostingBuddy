import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../models/data/GridData.dart';
import '../../utils/consts.dart';

class GridViewClass extends StatelessWidget {
  const GridViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 3.0,
      mainAxisSpacing: 5.0,
      shrinkWrap: true,
      childAspectRatio: (0.8 / 0.5),
      children: List.generate(4, (index) {
        return Padding(
            padding: EdgeInsets.all(V_SMALL_PAD_HOR),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: TEXT_COLOR[index],
                    width: AppConstants().height * 0.0033),
                borderRadius: BorderRadius.circular(20),
                color: BG_COLOR[index],
              ),
              //color: Color(int.parse(GridData.grid_list[index].bgColor)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppConstants().height * 0.026),
                    child: Text(
                      GridData.grid_list[index].title,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: TEXT_COLOR[index]),
                      ),
                    ),
                  ),
                  Text(
                    GridData.grid_list[index].num.toString(),
                    style: TextStyle(
                        fontSize: AppConstants().height * 0.021,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ));
      }),
    );
  }
}

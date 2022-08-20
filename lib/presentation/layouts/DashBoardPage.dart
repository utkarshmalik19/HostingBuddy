import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scaffold/presentation/layouts/PersonalDetails.dart';


import '../../blocs/blocs.dart';
import '../../utils/consts.dart';
import '../elements/GridView.dart';
import '../elements/TabBar/dashboard_tab_bar.dart';
import '../elements/drop_down.dart';
import 'HostJourney.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff1A191E),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all(SMALL_PAD_HOR),
                  child: Text(
                    "Dashboard",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: V_LARGE_FONT_SIZE),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER,horizontal: LARGE_PAD_HOR,),
                  child: DropDown(),
                ),
                GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetails())),
                    child: Container(child: GridViewClass())),
                Expanded(child: TabBarMenu()),
              ],
            )
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smconfapp/sample_data/sample_data.dart';
import 'package:smconfapp/widgets/session_item.dart';
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        body: ListView.builder(itemBuilder: (context,index)=>SessionItem(session: session),itemCount: 20,),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          bottom: CupertinoTabBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: FaIcon(
                FontAwesomeIcons.calendarDay
              ),label: "November 9" ),
              BottomNavigationBarItem(icon: FaIcon(
                  FontAwesomeIcons.calendarDay
              ),label: "November 10" ),
              BottomNavigationBarItem(icon: FaIcon(
                  FontAwesomeIcons.calendarDay
              ),label: "November 11" )
            ],
            currentIndex: currentIndex,
          ),
        ),

      ) ,
      length: 3,
    );
  }
}

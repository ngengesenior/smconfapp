import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smconfapp/data/session.dart';
class SessionItem extends StatelessWidget {
  final Session session;
  const SessionItem({Key? key,required this.session}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String startTime = session.getStartTimeString();
    String time = startTime.substring(0,6);
    String amPm = startTime.substring(6);
    //06:00 AM
    return Card(
      child: Container(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 100
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Text(time),
                Text(amPm)
              ],
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(session.title),
                  SizedBox(height: 10,),
                  Text("${session.getStartTimeString()} - ${session.getEndTimeString()}/}${session.hall.name}",style: GoogleFonts.raleway(
        textStyle: Theme.of(context).textTheme.caption
        )),
                  SingleChildScrollView(child: Row(children: session.tags.map((tag) => Chip(label: Text(tag.name))).toList(),),scrollDirection: Axis.horizontal,),
                ],
              ),
            ),
            SizedBox(width: 12,),
            Icon(Icons.save),
            SizedBox(width: 12,),
            Icon(Icons.star_border_outlined)
          ],
        ),
      ),
    );
  }
}

import 'package:smconfapp/data/hall.dart';
import 'package:smconfapp/data/lat_lon.dart';
import 'package:smconfapp/data/session.dart';
import 'package:smconfapp/data/tag.dart';

var session = Session(sessionId: "1", title: "Introduction to SM",
    description: "The talk details all about SM and its startups",
    photoUrl: "https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80",
    startTime: DateTime.now(), endTime: DateTime.now().add(Duration(hours: 4)), speakers:Set.from([speaker1]) ,
    tags: [Tag("1", "Community"),Tag("2", "smconf")],hall: Hall("Amphi 200","1",LatLong(0.0,0.0),));



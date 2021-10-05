import 'package:intl/intl.dart';
import 'package:smconfapp/data/hall.dart';
import 'package:smconfapp/data/speaker.dart';
import 'package:smconfapp/data/tag.dart';

class Session {
  final String sessionId;
  final String title;
  final String description;
  final String photoUrl;
  final Hall hall;
  final DateTime startTime;
  final DateTime endTime;
  final Set<Speaker> speakers;
  final List<Tag> tags;

  const Session({required this.sessionId,required this.title, required this.description, required this.photoUrl,required this.hall,
     required this.startTime,required this.endTime,required this.speakers, required this.tags});

  bool sessionIsNow() {
    var now = DateTime.now().toUtc();

    return (now.compareTo(startTime) >= 0 && endTime.compareTo(now) >= 0);
  }

  Duration calculateSessionDuration() {
    return endTime.difference(startTime);
  }

  String getStartTimeString() {
    return DateFormat("hh:mm a").format(startTime);
  }

  String getEndTimeString() {
    return DateFormat("hh:mm a").format(endTime);
  }

}


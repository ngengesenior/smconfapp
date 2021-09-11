import 'package:smconfapp/data/speaker.dart';

class Session {
  final String sessionId;
  final String title;
  final String description;
  final String photoUrl;
  final DateTime startTime;
  final DateTime endTime;
  final Set<Speaker> speakers;

  const Session({required this.sessionId,required this.title, required this.description, required this.photoUrl,
     required this.startTime,required this.endTime,required this.speakers});

  bool sessionIsNow() {
    var now = DateTime.now().toUtc();

    return (now.compareTo(startTime) >= 0 && endTime.compareTo(now) >= 0);
  }

  Duration calculateSessionDuration() {
    return endTime.difference(startTime);
  }

}
import 'package:moodly/code/features/homepage/presentation/painters/mood_face_painter.dart';

class MoodEntry {
  final String id;
  final Mood mood;
  final DateTime loggedAt;

  const MoodEntry({
    required this.id,
    required this.mood,
    required this.loggedAt,
  });

  String get shortDate {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final wd = weekdays[loggedAt.weekday - 1];
    return '$wd ${loggedAt.day}';
  }

  String get timeLabel {
    final h = loggedAt.hour.toString().padLeft(2, '0');
    final m = loggedAt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}

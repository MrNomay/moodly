import 'package:flutter/material.dart';

import 'package:moodly/code/features/homepage/data/models/mood_entry.dart';
import 'package:moodly/code/features/homepage/presentation/painters/mood_face_painter.dart';

class MoodProvider extends ChangeNotifier {
  final List<MoodEntry> _entries = [];

  Mood? _pendingMood;
  bool _showConfirmation = false;

  List<MoodEntry> get timelineEntries {
    if (_entries.length <= 7) return _entries;
    return _entries.sublist(0, 7);
  }

  Mood? get pendingMood => _pendingMood;

  bool get showConfirmation => _showConfirmation;

  MoodEntry? get latestEntry => _entries.isNotEmpty ? _entries.first : null;

  void selectMood(Mood mood) {
    _pendingMood = _pendingMood == mood ? null : mood;
    notifyListeners();
  }

  void logMood() {
    final mood = _pendingMood;
    if (mood == null) return;

    final now = DateTime.now();

    final entry = MoodEntry(
      id: '${now.millisecondsSinceEpoch}',
      mood: mood,
      loggedAt: now,
    );

    _entries.insert(0, entry);
    _pendingMood = null;
    _showConfirmation = true;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 1800), () {
      _showConfirmation = false;
      notifyListeners();
    });
  }

  Future<void> startEntryAnimation(AnimationController controller) async {
    await controller.forward(from: 0);
    await controller.reverse();
  }
}

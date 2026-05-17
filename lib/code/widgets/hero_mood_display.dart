import 'package:flutter/material.dart';
import 'package:moodly/code/features/homepage/presentation/provider/mood_provider.dart';
import 'package:moodly/code/features/homepage/data/models/mood_entry.dart';
import 'package:moodly/code/features/homepage/presentation/painters/mood_face_painter.dart';
import 'package:moodly/utils/app_text.dart';
import 'package:provider/provider.dart';

class HeroMoodDisplay extends StatelessWidget {
  const HeroMoodDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final latest = context.watch<MoodProvider>().latestEntry;

    if (latest == null) {
      return _EmptyHero();
    }

    return _FilledHero(entry: latest);
  }
}

class _EmptyHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.indigo.shade900, width: 1.5),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              'Nothing logged yet.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 8),
            AppText(
              'Pick a mood below and tap Log it.',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilledHero extends StatelessWidget {
  final MoodEntry entry;

  const _FilledHero({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: entry.mood.colorAccent.withValues(alpha: 0.35),
          width: 1.5,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            entry.mood.colorAccent.withValues(alpha: 0.08),
            Colors.blueGrey.shade900,
          ],
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 32),
          MoodFace(mood: entry.mood, size: 100),
          const SizedBox(width: 28),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Last logged',
                  style: TextStyle(
                    fontSize: 11,
                    color: entry.mood.colorAccent.withValues(alpha: 0.6),
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                AppText(
                  entry.mood.label,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                AppText(
                  '${entry.shortDate}  ${entry.timeLabel}',
                  style: TextStyle(fontSize: 13, color: Colors.indigo.shade200),
                ),
              ],
            ),
          ),
          Container(
            width: 4,
            height: 80,
            margin: const EdgeInsets.only(right: 24),
            decoration: BoxDecoration(
              color: entry.mood.colorAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

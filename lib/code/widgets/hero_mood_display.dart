import 'package:flutter/material.dart';
import 'package:moodly/utils/app_text.dart';

class HeroMoodDisplay extends StatelessWidget {
  const HeroMoodDisplay({super.key});

  @override
  Widget build(BuildContext context) {
     String? latest;

    if (latest == '') {
      return _EmptyHero();
    }

    return _FilledHero();
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


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.indigo,
          width: 1.5,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.indigo.withValues(alpha: 0.08),
            Colors.blueGrey.shade900,
          ],
        ),
      ),
      child: Row(
        children: [
          
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
                    color: Colors.indigo.shade200,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                AppText(
                  'Happy',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                AppText(
                  'Today, 10:30 AM',
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
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

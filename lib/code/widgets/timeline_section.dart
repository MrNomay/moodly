import 'package:flutter/material.dart';
import 'package:moodly/code/features/homepage/presentation/provider/mood_provider.dart';
import 'package:moodly/code/widgets/timeline_card.dart';
import 'package:moodly/code/widgets/timeline_empty.dart';
import 'package:moodly/utils/app_text.dart';
import 'package:provider/provider.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = context.watch<MoodProvider>().timelineEntries;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const AppText(
              'Past entries',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.indigo.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: AppText(
                '${entries.length}/7',
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        if (entries.isEmpty)
          const EmptyTimeline()
        else
          SizedBox(
            height: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: entries.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return TimelineCard(entry: entries[index]);
              },
            ),
          ),
      ],
    );
  }
}



import 'package:flutter/material.dart';
import 'package:moodly/utils/app_text.dart';

class EmptyTimeline extends StatelessWidget {
  const EmptyTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.indigo.shade900, width: 1),
      ),
      child: const Center(
        child: AppText(
          'Log a mood to start your timeline.',
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
    );
  }
}

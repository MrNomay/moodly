import 'package:flutter/material.dart';
import 'package:moodly/code/widgets/hero_mood_display.dart';
import 'package:moodly/code/widgets/mood_selector_card.dart';
import 'package:moodly/code/widgets/timeline_section.dart';
import 'package:moodly/utils/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ScreenHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 36),
                      HeroMoodDisplay(),
                      SizedBox(height: 48),
                      MoodSelectorCard(),
                      SizedBox(height: 52),
                      TimelineSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenHeader extends StatelessWidget {
  const _ScreenHeader();

  String _formattedDate() {
    final now = DateTime.now();
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return '${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 28, 32, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppRichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Mood',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: Colors.blueGrey,
                    letterSpacing: 1.2,
                  ),
                ),
                TextSpan(
                  text: 'Tracker',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.indigo.shade900, width: 1),
            ),
            child: AppText(
              _formattedDate(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

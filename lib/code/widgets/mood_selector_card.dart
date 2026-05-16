import 'package:flutter/material.dart';
import 'package:moodly/utils/app_text.dart';

class MoodSelectorCard extends StatelessWidget {
  const MoodSelectorCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> mood=['Happy', 'Sad', 'Angry', 'Neutral'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(
          'How are you feeling right now?',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: mood
              .map((m) => Expanded(child: _MoodPickerFace(mood: m)))
              .toList(),
        ),
        const SizedBox(height: 28),
        const LogButton(),
        const SizedBox(height: 16),
      ],
    );
  }
}

class LogButton extends StatelessWidget {
  const LogButton({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        height: 54,
        decoration: BoxDecoration(
          color:  Colors.blueGrey.shade900,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:  Colors.indigo.shade900,
          ),
         
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color:  Colors.white,
              letterSpacing: 0.5,
            ),
            child: AppText('Select a mood first'),
          ),
        ),
      ),
    );
  }
}


class _MoodPickerFace extends StatelessWidget {
  final String mood;

  const _MoodPickerFace({required this.mood});

  @override
  Widget build(BuildContext context) {


    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color:  Colors.indigo.shade900,
              width:  1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                child: FlutterLogo(),
              ),
              const SizedBox(height: 10),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color:  Colors.indigo,
                  letterSpacing: 0.3,
                ),
                child: AppText(mood, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

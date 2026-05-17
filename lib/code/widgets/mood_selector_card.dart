import 'package:flutter/material.dart';
import 'package:moodly/code/features/homepage/presentation/painters/mood_face_painter.dart';
import 'package:moodly/code/features/homepage/presentation/provider/mood_provider.dart';
import 'package:moodly/utils/app_text.dart';
import 'package:provider/provider.dart';

class MoodSelectorCard extends StatelessWidget {
  const MoodSelectorCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          children: Mood.values
              .map((m) => Expanded(child: _MoodPickerFace(mood: m)))
              .toList(),
        ),
        const SizedBox(height: 28),
        const LogButton(),
        const SizedBox(height: 16),
        const ConfirmationBanner(),
      ],
    );
  }
}

class LogButton extends StatelessWidget {
  const LogButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MoodProvider>();
    final pendingMood = provider.pendingMood;
    final canLog = pendingMood != null;

    return MouseRegion(
      cursor: canLog ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: canLog ? () => provider.logMood() : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          height: 54,
          decoration: BoxDecoration(
            color: canLog ? pendingMood.colorAccent : Colors.blueGrey.shade900,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: canLog ? pendingMood.colorAccent : Colors.indigo.shade900,
            ),
            boxShadow: canLog
                ? [
                    BoxShadow(
                      color: pendingMood.colorAccent.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: canLog ? Colors.white : Colors.white,
                letterSpacing: 0.5,
              ),
              child: AppText(canLog ? 'Log it' : 'Select a mood first'),
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationBanner extends StatelessWidget {
  const ConfirmationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final show = context.watch<MoodProvider>().showConfirmation;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: show ? 1 : 0,
      child: AnimatedSlide(
        offset: show ? Offset.zero : const Offset(0, 0.4),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const AppText(
                'Mood logged!',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoodPickerFace extends StatelessWidget {
  final Mood mood;

  const _MoodPickerFace({required this.mood});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MoodProvider>();
    final isSelected = provider.pendingMood == mood;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => provider.selectMood(mood),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? mood.colorAccent.withValues(alpha: 0.12)
                : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected ? mood.colorAccent : Colors.indigo.shade900,
              width: isSelected ? 1.8 : 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                child: MoodFace(mood: mood, size: 58),
              ),
              const SizedBox(height: 10),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: isSelected ? mood.colorAccent : Colors.indigo,
                  letterSpacing: 0.3,
                ),
                child: AppText(mood.label, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

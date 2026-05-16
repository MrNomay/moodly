import 'package:flutter/material.dart';
import 'package:moodly/utils/app_text.dart';

class TimelineCard extends StatefulWidget {
  const TimelineCard({super.key});

  @override
  State<TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _glowAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );

    _scaleAnim = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.18,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 45,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.18,
          end: 0.95,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.95,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
    ]).animate(_controller);

    _glowAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: Container(
              width: 118,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Color.lerp(
                    Colors.blueGrey,
                    Colors.indigo.shade900,

                    _glowAnim.value * 0.9,
                  )!,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withValues(
                      alpha: 0.0 + _glowAnim.value * 0.35,
                    ),
                    blurRadius: 22,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'Date',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  AppText(
                    'Time',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 3,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withValues(
                        alpha: 0.5 + _glowAnim.value * 0.5,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

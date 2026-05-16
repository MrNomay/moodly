import 'package:flutter/material.dart';
import 'package:moodly/code/features/homepage/presentation/pages/home_screen.dart';
import 'package:moodly/code/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Moodly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

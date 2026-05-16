import 'package:moodly/code/features/homepage/presentation/provider/mood_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => MoodProvider()),
];

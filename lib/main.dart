import 'package:coffers_in/pages/splash_screean_page.dart';
import 'package:coffers_in/util/colors/colors_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: COLOR_COFFEE),
        useMaterial3: true,
      ),
      home: const SplashScreeanPage(),
    );
  }
}

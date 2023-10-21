import 'package:cp_shopping/common/color_extension.dart';
 import 'package:flutter/material.dart';

import 'view/on_boarding/on_boarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CP Shopping',
      theme: ThemeData(
        fontFamily: "San Francisco Display",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: const OnBoardingView(),
    );
  }
}

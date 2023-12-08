import 'package:cp_shopping/common/color_extension.dart';
import 'package:cp_shopping/firebase_options.dart';
import 'package:cp_shopping/view/main_tab/main_tabview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/on_boarding/on_boarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const MyApp(),
  );
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
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return const MainTabView();
            } else {
              return const OnBoardingView();
            }
          }),
    );
  }
}

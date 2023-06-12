import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/exploration_controller.dart';
import 'views/pages/bottom_navigations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ExplorationFactProvider>(
          create: (context) => ExplorationFactProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Educational App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigations(),
    );
  }
}

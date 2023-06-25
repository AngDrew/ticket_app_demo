import 'package:flutter/material.dart';

import 'features/my_home_view.dart';

void main() {
  runApp(const MyApp());
}

// Dribbble Link:
// https://dribbble.com/shots/21438079-Flight-Booking-Mobile-App-UI-UX-Design

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeView(title: 'TiketKuy'),
    );
  }
}

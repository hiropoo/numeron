import 'package:flutter/material.dart';
import 'package:numeron/numeron.dart';
import 'package:numeron/start_menu.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'フラッター',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => const StartMenu(),
        "/second": (BuildContext context) => const Numeron(title: "NumerOn"),
      },
    );
  }
}

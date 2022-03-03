import 'package:flutter/material.dart';
import 'package:flutter_makeup/feature/home/view/makeup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.amber.shade100,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        primarySwatch: Colors.grey,
      ),
      home: const MakeupView(),
    );
  }
}

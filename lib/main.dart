import 'package:flutter/material.dart';
import 'package:my_new/views/Screen/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'DeepWallpaper',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),



    );   
  }
}
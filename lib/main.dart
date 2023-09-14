// import 'package:flutter/material.dart';
// import 'package:my_new/views/Screen/home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CoolWalls',
//       theme: ThemeData(primarySwatch: Colors.red),
//       home: const HomeScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_new/views/Screen/home.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Request the permission as soon as the app starts
    _requestPermission();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoolWalls',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),
    );
  }

  // Function to request the WRITE_EXTERNAL_STORAGE permission
  Future<void> _requestPermission() async {
    // Request the WRITE_EXTERNAL_STORAGE permission
    var status = await Permission.storage.request();

    if (status.isGranted) {
      // Permission is granted
      print('Permission is granted');
    } else if (status.isDenied) {
      // Permission is denied
      print('Permission is denied');
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied
      print('Permission is permanently denied');
    }
  }
}
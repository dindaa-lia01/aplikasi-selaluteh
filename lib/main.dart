import 'package:flutter/material.dart';
import 'pages/cover_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selalu Teh',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: CoverPage(),
    );
  }
}

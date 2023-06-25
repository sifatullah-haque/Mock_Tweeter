import 'package:awaz/pages/future_builder.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('twitter clone'),
        ),
        body: future(),
      ),
    );
  }
}

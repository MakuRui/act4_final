import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main () => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Activity #4',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const HomePage(),
    );
  }
}

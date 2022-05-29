import 'package:fitui/home_page/screen.dart';

//import 'package:fitui/widgets/process_ind.dart';
import 'package:flutter/material.dart';

//import 'home_page/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

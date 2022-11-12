import 'package:flutter/material.dart';
import 'package:note_pad/home_page.dart';

void main() {
  runApp(const NotePadApp());
}
class NotePadApp extends StatelessWidget {
  const NotePadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

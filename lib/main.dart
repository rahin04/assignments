import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

//import 'ShoppingCartScreen.dart';
import 'ShoppingCartScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


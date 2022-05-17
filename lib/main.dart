import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BUSmallah App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // primary: Color(0xFF3B85C3)
        ),
        fontFamily: 'PlusJakarta'
      ),
      home: const HomeScreen(),
    );
  }
}
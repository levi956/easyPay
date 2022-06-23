import 'package:eazy_pay/app/pages/dashboard.dart';
import 'package:eazy_pay/app/pages/input_pin.dart';
import 'package:eazy_pay/app/pages/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo fintech application',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const NavBar(),
    );
  }
}


// to do
// bills screen, airtime providers and dstv


//user profile (name, image, sign out button, help, security)


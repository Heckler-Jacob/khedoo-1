import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedoo/screens/landing_screen.dart';
import 'package:khedoo/utilities/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xffD83A56)),
        textTheme: GoogleFonts.openSansTextTheme(textTheme).copyWith(
          bodyText2: GoogleFonts.openSans(textStyle: textTheme.bodyText2),
        ),
      ),
      home: LandingScreen(),
    );
  }
}

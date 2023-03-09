import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepali_connect/pages/chatpage/conversation.dart';
import 'package:nepali_connect/pages/navigation.dart';
import 'package:nepali_connect/pages/splashscreen.dart';

void main() {
  runApp(const NepaliWarDrobe());
}

class NepaliWarDrobe extends StatelessWidget {
  const NepaliWarDrobe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nepali Wardrobe",
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
      ),
      home: const SplashScreen(),
      // home:  PageNavigator(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_new_project/bottom_navigation_layout.dart';
import 'package:my_new_project/widgets/carousel_with_dots.dart';

class GetstartedPage extends StatefulWidget {
  const GetstartedPage({super.key});

  @override
  State<GetstartedPage> createState() => _GetstartedPageState();
}

class _GetstartedPageState extends State<GetstartedPage> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme.primary;
    final double screenHeight = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight, child: CarouselWithDots()),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationLayout()));
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: themeColor,
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                child: Text(
                  "Getting Started",
                  style: GoogleFonts.ptSans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 14)),
                )),
          ),
        ],
      ),
    );
  }
}

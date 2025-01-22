import 'package:flutter/material.dart';
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

    return Scaffold(
      body: Column(
        children: [
          const CarouselWithDots(),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: themeColor,
                  textStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              child: const Text(
                "Sign up with Email",
              )),
          const Row(
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(color: const Color.fromARGB(255, 80, 78, 78)),
              ),
              Text(
                "Login",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const Text(
            "Skip For Now",
            style: TextStyle(
                color: Color.fromARGB(255, 99, 95, 95),
                decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}

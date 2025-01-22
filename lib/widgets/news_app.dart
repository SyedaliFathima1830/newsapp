import 'package:flutter/material.dart';
import 'package:my_new_project/screens/getstarted_page.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return const GetstartedPage();
  }
}

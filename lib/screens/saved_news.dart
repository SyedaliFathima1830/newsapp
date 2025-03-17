import 'package:flutter/material.dart';
import 'package:my_new_project/widgets/newsfeed_card.dart';

class SavedNews extends StatefulWidget {
  const SavedNews({super.key});

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  final List<Map<String, String>> savedNews = [
    {
      'image': 'https://via.placeholder.com/150',
      'category': 'Technology',
      'title': 'Flutter 3.0 Released',
      'date': 'March 17, 2025',
      'author': 'John Doe',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'category': 'Health',
      'title': 'New Breakthrough in Medicine',
      'date': 'March 16, 2025',
      'author': 'Jane Smith',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'category': 'Sports',
      'title': 'Champions League Final Highlights',
      'date': 'March 15, 2025',
      'author': 'Alex Brown',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Saved News'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: savedNews.length,
        itemBuilder: (context, index) {
          final news = savedNews[index];
          return NewsFeedCard(
            isSavedItems: true,
            image: news['image']!,
            category: news['category']!,
            title: news['title']!,
            date: news['date']!,
            author: news['author']!,
          );
        },
      ),
    );
  }
}

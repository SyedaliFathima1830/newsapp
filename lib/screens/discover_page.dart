import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int selectedIndex = 0;

  // Categories for filtering news
  List<String> categories = [
    "All",
    "News",
    "Sports",
    "Education",
    "Ecommerce",
    "Technology",
    "Health",
    "Entertainment"
  ];

  // Dummy News Data
  List<Map<String, String>> newsList = [
    {
      "image": "assets/png/newsfeedlist.png",
      "category": "News",
      "title": "Breaking: Major World Event",
      "date": "March 28, 2025",
      "author": "John Doe"
    },
    {
      "image": "assets/png/newsfeedlist.png",
      "category": "Sports",
      "title": "Champions League Final Review",
      "date": "March 27, 2025",
      "author": "Emily Smith"
    },
    {
      "image": "assets/png/newsfeedlist.png",
      "category": "Education",
      "title": "New Learning Methods in Schools",
      "date": "March 26, 2025",
      "author": "Michael Brown"
    },
    {
      "image": "assets/png/newsfeedlist.png",
      "category": "Technology",
      "title": "AI Revolution in 2025",
      "date": "March 25, 2025",
      "author": "Sophia Lee"
    },
    {
      "image": "assets/png/newsfeedlist.png",
      "category": "Health",
      "title": "Top 10 Health Tips for a Better Life",
      "date": "March 24, 2025",
      "author": "David Johnson"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme.primary;

    // Filtered news based on selected category
    List<Map<String, String>> filteredNews = selectedIndex == 0
        ? newsList
        : newsList
            .where((news) => news["category"] == categories[selectedIndex])
            .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text("DISCOVER",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(height: 2),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text("Find all the news",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: FilterChip(
                      label: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(categories[index]),
                      ),
                      selected: selectedIndex == index,
                      selectedColor: themeColor,
                      backgroundColor: Colors.white,
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                        side: BorderSide(
                          color: selectedIndex == index
                              ? themeColor
                              : Colors.grey.shade300,
                        ),
                      ),
                      labelStyle: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Displaying News Based on Category Selection
          Expanded(
            child: filteredNews.isEmpty
                ? const Center(
                    child: Text("No news available for this category"))
                : ListView.builder(
                    itemCount: filteredNews.length,
                    itemBuilder: (context, index) {
                      final news = filteredNews[index];
                      return NewsFeedCard(
                        isSavedItems: false,
                        image: news['image']!,
                        category: news['category']!,
                        title: news['title']!,
                        date: news['date']!,
                        author: news['author']!,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// Dummy NewsFeedCard Widget
class NewsFeedCard extends StatelessWidget {
  final bool isSavedItems;
  final String image;
  final String category;
  final String title;
  final String date;
  final String author;

  const NewsFeedCard({
    super.key,
    required this.isSavedItems,
    required this.image,
    required this.category,
    required this.title,
    required this.date,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: GoogleFonts.merriweather(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("By $author",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(date,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

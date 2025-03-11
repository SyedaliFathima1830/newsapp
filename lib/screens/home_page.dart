import 'package:flutter/material.dart';
import 'package:my_new_project/widgets/newsfeed_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes back arrow
        title: Row(
          children: [
            Icon(Icons.dashboard, color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            const Text("App Name"),
          ],
        ),
        actions: const [
          CircleAvatar(
            radius: 20,
            backgroundImage:
                AssetImage('assets/profile.jpg'), // Dummy profile image
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        // ✅ Allows scrolling if content is too long
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Highlights Section
            const Text(
              "Highlights",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),

            // News Card
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/news_image.jpg', // Replace with your asset
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // ✅ Handles missing image error
                          return Container(
                            color: Colors.grey,
                            child: const Center(
                              child: Text("Image Not Found",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          );
                        },
                      ),
                    ),
                    // Overlay for better text visibility
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent
                            ],
                          ),
                        ),
                      ),
                    ),
                    // News Heading & Button
                    Positioned(
                      left: 16,
                      bottom: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Breaking News Headline",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "A short description of the news...",
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text("Read More ->"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // ✅ Extra space at the bottom

            const Text(
              "Picked For You",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                // final news = 1;
                return const NewsFeedCard(
                    image: "no imahe",
                    category: "sports",
                    title: "fth ufrg h gg titile ooooo",
                    date: "45/44/3333 ",
                    author: "authorr");
              },
            )
          ],
        ),
      ),
    );
  }
}

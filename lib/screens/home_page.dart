import 'package:flutter/material.dart';
import 'package:my_new_project/widgets/hightlights_card.dart';
import 'package:my_new_project/widgets/newsfeed_card.dart';
import 'package:my_new_project/widgets/view_profile_image.dart';

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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewProfileImage(
                    profilePic: "assets/png/profile.jpg",
                  ),
                ),
              );
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundImage:
                  AssetImage('assets/png/profile.jpg'), // Dummy profile image
            ),
          ),
          const SizedBox(width: 16),
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
            //call here
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HightlightsCard(
                        newsTitle: "dummy title",
                        description: "dummy text",
                      ),
                    ),
                  );
                },
              ),
            ),

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
                    isSavedItems: false,
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

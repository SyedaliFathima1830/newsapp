import 'package:flutter/material.dart';

class NewsFeedCard extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String date;
  final String author;

  const NewsFeedCard({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.date,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding:
            const EdgeInsets.all(8.0), // Increased padding for better spacing
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                width: 50, // Slightly larger for better visibility
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/png/newsfeedlist.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(width: 12),

            // News Details (Expanded to take remaining space)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  Text(
                    category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // News Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Author & Date Row (Aligned to opposite corners)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          author,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          overflow:
                              TextOverflow.ellipsis, // Handle long author names
                        ),
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

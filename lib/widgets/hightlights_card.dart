import 'package:flutter/material.dart';

class HightlightsCard extends StatefulWidget {
  final String newsTitle;
  final String description;

  const HightlightsCard(
      {required this.newsTitle, required this.description, super.key});

  @override
  State<HightlightsCard> createState() => _HightlightsCardState();
}

class _HightlightsCardState extends State<HightlightsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/news_image.jpg',
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
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
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
                  Text(
                    widget.newsTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.white70),
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
    );
  }
}

import 'package:flutter/material.dart';

class NewsFeedCard extends StatefulWidget {
  final String image;
  final String category;
  final String title;
  final String date;
  final String author;
  final bool isSavedItems;

  const NewsFeedCard({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.date,
    required this.author,
    required this.isSavedItems,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: widget.isSavedItems == true
            ? const EdgeInsets.only(top: 15.0)
            : const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.image,
                width: widget.isSavedItems == true ? 70 : 50,
                height:
                    widget.isSavedItems ? 100 : 50, // Increase height if saved
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/png/newsfeedlist.png',
                    width: 50,
                    height: widget.isSavedItems ? 100 : 50,
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
                    widget.category.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // News Title
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Author & Date Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.author,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        widget.date,
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

            // Three vertical dots if isSavedItems is true
            if (widget.isSavedItems)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.more_vert, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewNewsScreen extends StatelessWidget {
  const ViewNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200], // Light white header
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "News Article",
          style: GoogleFonts.merriweather(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {
              // Save action
            },
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Share action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with Newspaper-style font
              Text(
                "Breaking News: A Major Event Unfolds",
                style: GoogleFonts.oldStandardTt(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // News Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/png/newsfeedlist.png", // Ensure this image is in assets
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              Text(
                "A shocking development has taken place, causing ripples across the world.",
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 15),

              // News Content
              Text(
                "In a surprising turn of events, a major incident has occurred that is set to change the landscape of global affairs. "
                "Sources confirm that early morning, several key figures gathered to address the unfolding situation. "
                "Experts are already weighing in on the possible implications, and reactions have been pouring in from around the world.\n\n"
                "Eyewitnesses describe scenes of both concern and urgency as officials scramble to respond. "
                "According to insiders, this incident could have far-reaching consequences, affecting economies, politics, and even everyday life. "
                "Governments are now working around the clock to assess the full impact of what has transpired.\n\n"
                "Meanwhile, social media is ablaze with speculation, analysis, and firsthand accounts. "
                "People are tuning into news outlets for live updates, eager to understand how this will shape the future.\n\n"
                "As we continue to gather details, one thing remains certain: this is a moment that will be remembered for years to come."
                "In a surprising turn of events, a major incident has occurred that is set to change the landscape of global affairs. "
                "Sources confirm that early morning, several key figures gathered to address the unfolding situation. "
                "Experts are already weighing in on the possible implications, and reactions have been pouring in from around the world.\n\n"
                "Eyewitnesses describe scenes of both concern and urgency as officials scramble to respond. "
                "According to insiders, this incident could have far-reaching consequences, affecting economies, politics, and even everyday life. "
                "Governments are now working around the clock to assess the full impact of what has transpired.\n\n"
                "Meanwhile, social media is ablaze with speculation, analysis, and firsthand accounts. "
                "People are tuning into news outlets for live updates, eager to understand how this will shape the future.\n\n"
                "As we continue to gather details, one thing remains certain: this is a moment that will be remembered for years to come.",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

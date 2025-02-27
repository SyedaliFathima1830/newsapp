import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_new_project/widgets/single_image_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import the SingleImageCard widget

class CarouselWithDots extends StatefulWidget {
  const CarouselWithDots({super.key});

  @override
  State<CarouselWithDots> createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> titles = [
    "Get the latest and updated news easily with us",
    "Discover trending and updated news daily with us",
    "Breaking updates on trending topics shared just for you"
  ];

  final List<String> subtitles = [
    "Latest updates on the most popular and hot news with us",
    "Top stories from around the globe brought to you with ease",
    "Catch the latest and hottest news quickly with us"
  ];

  final List<String> imageUrls = [
    'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 80, bottom: 10, left: 25, right: 25),
            child: PageView.builder(
              controller: _pageController,
              itemCount: imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: SingleImageCard(imageurl: imageUrls[index]),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: _pageController,
          count: imageUrls.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            titles[currentPage],
            style: GoogleFonts.ptSans(
                textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subtitles[currentPage],
            style: GoogleFonts.ptSans(
                textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            )),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

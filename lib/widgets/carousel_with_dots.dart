import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWithDots extends StatefulWidget {
  const CarouselWithDots({super.key});

  @override
  State<CarouselWithDots> createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> titles = [
    "get the latest and updated news easily with us ",
    "Discover trending and updated news daily with us",
    "Breaking updates on trending topics shared just for you"
  ];

  final List<String> subtitles = [
    "latest updates on the most popular and hot news with us ",
    "Top stories from around the globe brought to you with ease",
    "Catch the latest and hottest news quickly with us"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              Image.network('https://via.placeholder.com/400x200',
                  fit: BoxFit.cover),
              Image.network('https://via.placeholder.com/400x200/0000FF',
                  fit: BoxFit.cover),
              Image.network('https://via.placeholder.com/400x200/FF0000',
                  fit: BoxFit.cover),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          titles[currentPage],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitles[currentPage],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}

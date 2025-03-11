import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  void _removeCurrentTab() {
    if (categories.length > 1) {
      setState(() {
        categories.removeAt(_tabController.index);
        _tabController.dispose();
        _tabController = TabController(length: categories.length, vsync: this);
        _tabController.addListener(() {
          setState(() {});
        });
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
              height: 70,
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
                              : Colors.white,
                        ),
                      ),
                      labelStyle: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedIndex == index
                              ? Colors.white
                              : const Color(0xff9CA4AB),
                        ),
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = index;
                          _tabController.index = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String category) {
    return Center(
      child: Text(
        "$category Content",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}

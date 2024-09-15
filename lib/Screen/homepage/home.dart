import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/homepage/bottomnavig.dart';
import 'package:mujjistore/Screen/homepage/productbuttonpage.dart';
import 'package:mujjistore/utilize/colors.dart';
import 'package:mujjistore/widgets/categoryicon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        if (nextPage > 2) nextPage = 0; // Loop back to the first page
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.location_on, color: Colors.red, size: 20),
                SizedBox(width: 5),
                Text(
                  'Select Location',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search and Filter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for products',
                        prefixIcon: const Icon(Icons.search, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Banner (PageView)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: SizedBox(
                height: 180, // Slightly taller banner
                child: PageView(
                  controller: _pageController,
                  children: [
                    Image.asset('assets/banner/bm3.jpeg', fit: BoxFit.cover),
                    Image.asset('assets/banner/bm1.jpeg', fit: BoxFit.cover),
                    Image.asset('assets/banner/bm2.jpeg', fit: BoxFit.cover),
                  ],
                ),
              ),
            ),
            // Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryIcon(imagePath: "assets/icon/ic1.jpeg", label: "T-shirts"),
                  CategoryIcon(imagePath: "assets/icon/ic2.jpeg", label: "Pants"),
                  CategoryIcon(imagePath: "assets/icon/ic2.jpg", label: "Jackets"),
                  CategoryIcon(imagePath: "assets/icon/ic4.jpeg", label: "Dresses"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Product Section
            const ProductButtonPage(),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const NavigatorMenu(),
    );
  }
}

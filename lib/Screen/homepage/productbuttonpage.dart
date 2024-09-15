import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/all_page.dart';
import 'package:mujjistore/Screen/checkout.dart';
import 'package:mujjistore/Screen/global_wishlist.dart';
import 'package:mujjistore/Screen/men_page.dart';

import 'package:mujjistore/Screen/newest_page.dart';
import 'package:mujjistore/Screen/popular_page.dart';
import 'package:mujjistore/Screen/women_page.dart';
import 'package:mujjistore/cartmanager.dart';
import 'package:mujjistore/utilize/colors.dart'; // Import your color definitions

class ProductButtonPage extends StatefulWidget {
  const ProductButtonPage({super.key});

  @override
  State<ProductButtonPage> createState() => _ProductButtonPageState();
}

class _ProductButtonPageState extends State<ProductButtonPage> {
  int selectedPageIndex = 0;

  // List of pages that will be displayed based on the selected index
  final List<Widget> pages = [
    AllPage(),
    const NewestPage(),
    const PopularPage(),
    const MenPage(),
    const WomenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Button Row
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildButton("All", 0),
                  const SizedBox(width: 3),
                  _buildButton("Newest", 1),
                  const SizedBox(width: 3),
                  _buildButton("Popular", 2),
                  const SizedBox(width: 3),
                  _buildButton("Men", 3),
                  const SizedBox(width: 3),
                  _buildButton("Women", 4),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),

          // Flexible widget allows the content below to take up the remaining space if needed
          Flexible(
            fit: FlexFit.loose,
            child: pages[selectedPageIndex], // Display the selected page
          ),
        ],
      ),
    );
  }

  // Helper method to build each button with custom styling
  Widget _buildButton(String label, int index) {
    final isSelected = selectedPageIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedPageIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color.fromARGB(255, 14, 1, 1) : Colors.white,
        side: BorderSide(
          color: isSelected ? Colors.transparent : Colors.grey,
          width: 1.0,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

List<Map<String, String>> cartItems = [];

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final VoidCallback onTap;

  const ProductCard({super.key, 
    required this.image,
    required this.name,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0), // Add margin around the card
        decoration: BoxDecoration(
          color: Colors.white, // Card background color
          borderRadius: BorderRadius.circular(12.0), // Rounded corners with more radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: SizedBox(
                height: 160.0, // Adjusted height for the image
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProductDetailsPage extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String description;
  final void Function(Map<String, String>) onAddToCart;

  const ProductDetailsPage({super.key, 
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name,style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(image, height: 250, width: 250, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16.0),
              Text(name, style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Text(price, style: TextStyle(fontSize: 24.0, color: Colors.grey[600])),
              const SizedBox(height: 16.0),
              Text(description.isNotEmpty ? description : 'No description available',
                  style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 24.0),
              const Text('Select Size:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _SizeButton(size: 'S'),
                  _SizeButton(size: 'M'),
                  _SizeButton(size: 'L'),
                  _SizeButton(size: 'XL'),
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      CartManager.addToCart({
                        'image': image,
                        'name': name,
                        'price': price,
                        'description': description,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$name added to Cart')));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle adding to wishlist
                      wishlistItems.add({
                        'image': image,
                        'name': name,
                        'price': price,
                        'description': description,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$name added to Wishlist')));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Add to Wishlist', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyNow(image: image, name: name, price: price),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Buy Now', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SizeButton extends StatelessWidget {
  final String size;

  const _SizeButton({required this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle size selection
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
      child: Text(size, style: const TextStyle(fontSize: 16.0)),
    );
  }
}
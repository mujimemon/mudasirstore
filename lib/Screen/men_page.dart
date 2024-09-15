import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/homepage/productbuttonpage.dart';
import 'package:mujjistore/utilize/colors.dart';

class MenPage extends StatelessWidget {
  const MenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
       {
      'image': 'assets/jacket1.jpg',
      'name': 'Columbia Mens Watertight II Rain Jacket',
      'price': '22000',
      'description':
          'Columbias rain jackets work around the clock to protect you from the outdoor elements. ',
    },
    {
      'image': 'assets/jacket2.jpg',
      'name': 'Legendary Whitetails Mens Rugged Full Zip Dakota Jacket',
      'price': '10000',
      'description':
          'Simply stated - the Dakota is our most unique, rugged casual jacket that can be worn with or without the removable hood and inner placket. ',
    },
    {
      'image': 'assets/jacket3.jpg',
      'name': 'Legendary Whitetails Mens Journeyman Shirt Jacket, Flannel Lined Shacket for Men, Water-Resistant Coat Rugged Fall Clothing',
      'price': '30000',
      'description':
          'We added a flannel lining to our popular weathered cotton shirt to build this one-of-a-kind shirt jac',
    },
    {
      'image': 'assets/jacket4.jpg',
      'name': 'Legendary Whitetails Archer Flannel Thermal Lined Shirt Jacket for Men, Quilted Insulated Plaid Work Outerwear Coat',
      'price': '60000',
      'description':
          'High quality construction and detail make this insulated flannel a standout Legendary shirt jac.',
    },
    ];

    final bool hasMoreThanFour = products.length > 4;
    final List<Map<String, String>> displayedProducts = hasMoreThanFour
        ? products.sublist(0, 4)
        : products;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: displayedProducts.map((product) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 16,
                child: ProductCard(
                  image: product['image']!,
                  name: product['name']!,
                  price: product['price']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          image: product['image']!,
                          name: product['name']!,
                          price: product['price']!,
                          description: product['description']!,
                          onAddToCart: (item) {
                            // Update global cart list
                            cartItems.add(item);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
        if (hasMoreThanFour)
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllMenProductsPage(products: products),
                ),
              );
              
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
            ),
            child: const Text('See All',style: TextStyle(color: Colors.white),),
          ),
      ],
    );
  }
}

class AllMenProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;

  const AllMenProductsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Men\'s Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: products.map((product) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 16,
                child: ProductCard(
                  image: product['image']!,
                  name: product['name']!,
                  price: product['price']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          image: product['image']!,
                          name: product['name']!,
                          price: product['price']!,
                          description: product['description']!,
                          onAddToCart: (item) {
                            // Update global cart list
                            cartItems.add(item);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


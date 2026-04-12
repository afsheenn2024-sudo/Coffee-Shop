import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_chips.dart';
import '../widgets/coffee_card.dart';
import '../../data/models/coffee_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This tracks which category is currently active
  String selectedCategory = "Cappuccino";

  // Full list of all coffee data
  final List<Coffee> allCoffees = [
    // --- CAPPUCCINO SECTION ---
    Coffee(name: "Cappuccino", description: "with Chocolate", price: 4.53, rating: 4.8, imagePath: "asset/images/image3.png", category: "Cappuccino"),
    Coffee(name: "Cappuccino", description: "with Oat Milk", price: 3.90, rating: 4.9, imagePath: "asset/images/image4.png", category: "Cappuccino"),
    Coffee(name: "Cappuccino", description: "with Chocolate", price: 4.53, rating: 4.5, imagePath: "asset/images/image2.png", category: "Cappuccino"),
    Coffee(name: "Cappuccino", description: "with Oat Milk", price: 3.90, rating: 4.0, imagePath: "asset/images/image1.png", category: "Cappuccino"),

    // --- MACHIATO SECTION ---
    Coffee(name: "Machiato", description: "with Caramel", price: 5.10, rating: 4.7, imagePath: "asset/images/M1.jpg", category: "Machiato"),
    Coffee(name: "Machiato", description: "Rich Foam", price: 4.80, rating: 4.6, imagePath: "asset/images/M2.jpg", category: "Machiato"),
    Coffee(name: "Machiato", description: "Vanilla Macchiato", price: 5.20, rating: 4.9, imagePath: "asset/images/M3.jpg", category: "Machiato"),
    Coffee(name: "Machiato", description: "Iced Macchiato", price: 4.90, rating: 4.4, imagePath: "asset/images/M5.jpg", category: "Machiato"),

    // --- LATTE SECTION ---
    Coffee(name: "Latte", description: "Vanilla Cream", price: 4.20, rating: 4.8, imagePath: "asset/images/L1.jpg", category: "Latte"),
    Coffee(name: "Latte", description: "Steamed Milk", price: 3.50, rating: 4.5, imagePath: "asset/images/L2.jpg", category: "Latte"),
    Coffee(name: "Latte", description: "Hazelnut Latte", price: 4.40, rating: 4.7, imagePath: "asset/images/L3.jpg", category: "Latte"),
    Coffee(name: "Latte", description: "Spanish Latte", price: 4.60, rating: 4.9, imagePath: "asset/images/L4.jpg", category: "Latte"),

    // --- AMERICANO SECTION ---
    Coffee(name: "Americano", description: "With Hot Water", price: 4.50, rating: 4.5, imagePath: "asset/images/A1.jpg", category: "Americano"),
    Coffee(name: "Americano", description: "Deep Roast", price: 3.33, rating: 4.8, imagePath: "asset/images/A2.jpg", category: "Americano"),
    Coffee(name: "Americano", description: "Double Shot", price: 5.55, rating: 4.9, imagePath: "asset/images/A3.jpg", category: "Americano"),
    Coffee(name: "Americano", description: "Iced Americano", price: 3.50, rating: 4.2, imagePath: "asset/images/A4.jpg", category: "Americano"),


  ];

  @override
  Widget build(BuildContext context) {
    // Filter the list dynamically based on the selected category
    final filteredCoffees = allCoffees
        .where((coffee) => coffee.category == selectedCategory)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      // extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              // Header Section
              _buildHeaderStack(),

              const SizedBox(height: 55),

              // Category Selection Bar
              CategoryChips(
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),

              const SizedBox(height: 24),

              // Filtered Coffee Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25), // Matches your Figma side padding
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // Ratio of 0.68 to 0.72 usually results in the ~239px height
                  // seen in your '335 x 239 Hug' screenshot
                  childAspectRatio: 0.627,
                  crossAxisSpacing: 16, // The gap between the two cards
                  mainAxisSpacing: 16,  // The gap between the rows
                ),
                itemCount: filteredCoffees.length,
                itemBuilder: (context, index) => CoffeeCard(coffee: filteredCoffees[index]),
              ),

              // // Padding for Bottom Nav
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- Helper UI Methods ---

  Widget _buildHeaderStack() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 161, // Increased height to prevent text overflow
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF131313), Color(0xFF313131)],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text("Location", style: TextStyle(color: Color(0xFFB7B7B7), fontSize: 12, fontFamily: 'Sora')),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      "West, Balurghat ",
                      style: TextStyle(
                        color: Color(0xFFDDDDDD),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Sora',
                      ),
                    ),
                    Image.asset("asset/icons/Arrow - Down 2.png", width: 14, height: 14),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 25,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("asset/images/Frame 3195.png", width: 44, height: 44),
          ),
        ),
        const Positioned(
          bottom: -26,
          left: 0,
          right: 0,
          child: CustomSearchBar(),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem("asset/icons/home.png", true),
          _buildNavItem("asset/icons/heart.png", false),
          _buildNavItem("asset/icons/Bag 2.png", false),
          _buildNavItem("asset/icons/bell.png", false),
        ],
      ),
    );
  }

  Widget _buildNavItem(String assetPath, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          assetPath,
          width: 24,
          height: 24,
          color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFF8D8D8D),
        ),
        if (isSelected) ...[
          const SizedBox(height: 4),
          Container(
            height: 5,
            width: 10,
            decoration: BoxDecoration(
              color: const Color(0xFFC67C4E),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ] else
          const SizedBox(height: 9),
      ],
    );
  }
}
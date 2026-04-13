import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
                "Your Daily Ritual",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sora'
                )
            ),
            const SizedBox(height: 8),
            const Text(
              "Quick access to the flavors you love most.",
              style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Sora'),
            ),
            const SizedBox(height: 24),

            _buildHorizontalFilter(),

            const SizedBox(height: 24),

            // Large Cards using only the images you provided
            _buildLargeFavCard(
                "Oat Milk Lavender Latte",
                "Floral, creamy, and naturally sweet.",
                "6.50",
                "asset/images/image1.png", // From your earlier list
                isBestseller: true
            ),
            const SizedBox(height: 16),
            _buildLargeFavCard(
                "Slow Drip Cold Brew",
                "12-hour immersion, bold finish.",
                "5.25",
                "asset/images/M1.jpg" // From your earlier list
            ),
            const SizedBox(height: 16),
            _buildLargeFavCard(
                "Double Espresso Shot",
                "Pure essence of Ethiopia beans.",
                "3.50",
                "asset/images/A1.jpg" // From your earlier list
            ),

            const SizedBox(height: 24),

            // Using image4 for the snack/croissant item as requested
            _buildSmallHorizontalCard(
                "Butter Croissant",
                "Baked fresh daily.",
                "4.00",
                "asset/images/image4.png"
            ),

            const SizedBox(height: 120), // Spacer to clear Bottom Nav
          ],
        ),
      ),
    );
  }

  // --- UI Components ---

  Widget _buildHorizontalFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _filterChip("All Favorites", true),
          _filterChip("Hot Brews", false),
          _filterChip("Iced Coffee", false),
        ],
      ),
    );
  }

  Widget _filterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2A1913) : Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: isSelected ? const Color(0xFFC67C4E) : Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildLargeFavCard(String title, String desc, String price, String img, {bool isBestseller = false}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                child: Image.asset(img, height: 220, width: double.infinity, fit: BoxFit.cover),
              ),
              const Positioned(
                top: 15, right: 15,
                child: CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: Icon(Icons.favorite, color: Colors.red, size: 22),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isBestseller)
                  const Text("BESTSELLER", style: TextStyle(color: Colors.brown, fontSize: 10, fontWeight: FontWeight.bold)),
                Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$$price", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Color(0xFF0C2114), shape: BoxShape.circle),
                      child: const Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSmallHorizontalCard(String title, String desc, String price, String img) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(img, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          const Icon(Icons.favorite, color: Colors.red, size: 20),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: const Color(0xFF0C2114), borderRadius: BorderRadius.circular(10)),
            child: const Row(
              children: [
                Text("Add", style: TextStyle(color: Colors.white, fontSize: 12)),
                SizedBox(width: 4),
                Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
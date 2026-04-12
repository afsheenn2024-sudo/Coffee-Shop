import 'package:flutter/material.dart';
// import '../../core/constants/app_colors.dart';
// import '../../core/constants/app_text_styles.dart';
import '../../data/models/coffee_model.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;

  const CoffeeCard({super.key, required this.coffee});

  @override
  // lib/presentation/widgets/coffee_card.dart
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4), // Inner padding for the card border
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The Image Container
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              coffee.imagePath,
              height: 132, // Adjust this to match the image height in Figma
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          // Text and Price section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffee.name, style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
                Text(coffee.description,
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ ${coffee.price}", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                    // The '+' button
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFC67C4E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
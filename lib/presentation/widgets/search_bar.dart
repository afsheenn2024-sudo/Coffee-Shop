import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Figma Left/Right padding: 25-30px
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF), // Figma search background is dark
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            // Updated to use the correct Figma Search Icon color
            Image.asset(
              "asset/icons/search-normal.png", // Or use Icons.search
              width: 20,
              height: 20,
              color: Colors.black,
            ),
            const Expanded(
              child: TextField(
                // Text user types should be white
                style: TextStyle(color: Colors.black, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Search coffee',
                  hintStyle: TextStyle(
                    color: Color(0xFF989898),
                    fontSize: 14,
                    fontFamily: 'Sora',
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
            // The Filter Icon (setting-4.png)
            Container(
              margin: const EdgeInsets.all(4),
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "asset/icons/setting-4.png",
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
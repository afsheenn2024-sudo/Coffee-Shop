import 'package:flutter/material.dart';
import '../../data/models/coffee_model.dart';

class CoffeeDetailsPage extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetailsPage({super.key, required this.coffee});

  @override
  State<CoffeeDetailsPage> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 375,
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Main Coffee Image
                  Positioned.fill(
                    child: Image.asset(
                      widget.coffee.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    right: 20,
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset("asset/icons/Arrow - Down 2.png",
                                width: 24, height: 24, color: Colors.white),
                          ),
                          Image.asset("asset/icons/heart.png",
                              width: 24, height: 24, color: Colors.white),
                        ],
                      ),
                    ),
                  ),

                  // 2. POSITIONED OVERLAY
                  Positioned(
                    bottom: -55,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.coffee.name,
                                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Sora'),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  widget.coffee.category,
                                  style: const TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Sora'),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xFFFBBE21), size: 24),
                              const SizedBox(width: 4.8),
                              Text(
                                "${widget.coffee.rating}",
                                style: const TextStyle(
                                    color: Color(0xFF2F2D2C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Sora'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),

            // 3. DESCRIPTION & SIZE CONTAINER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Description", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, fontFamily: 'Sora')),
                    const SizedBox(height: 20),
                    const Text(
                      "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More",
                      style: TextStyle(color: Colors.black, fontSize: 14 ,height: 1.6, fontWeight: FontWeight.w400, fontFamily: 'Sora'),
                    ),
                    const SizedBox(height: 20),
                    const Text("Size", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Sora')),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['S', 'M', 'L'].map((size) => _buildSizeButton(size)).toList(),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 4. PRICE & BUY BUTTON CONTAINER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 14,
                              fontFamily: 'Sora'
                          ),
                        ),
                        Text(
                          "\$ ${widget.coffee.price}",
                          style: const TextStyle(
                              color: Color(0xFFE27D19),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sora'
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 79),
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE27D19),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sora'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () => setState(() => selectedSize = size),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.24,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC67C4E).withValues(alpha: 0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFEAEAEA)),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? const Color(0xFFC67C4E) : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'Sora',
          ),
        ),
      ),
    );
  }
}

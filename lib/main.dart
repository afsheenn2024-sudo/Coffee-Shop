// ... (your imports remain the same)

class CoffeeIntroScreen extends StatelessWidget {
  const CoffeeIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black, // Background behind the image
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.6,
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.cover,
              // Adding an error builder helps you debug if it fails again
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey,
                child: const Icon(Icons.broken_image, color: Colors.white, size: 50),
              ),
            ),
          ),

          // Bottom Content
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * 0.45,
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              decoration: const BoxDecoration(
                color: Color(0xFF1C1C1C), // Matching dark coffee theme
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              // SingleChildScrollView prevents the "Bottom Overflow" error
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Coffee so good,\nyour taste buds will love it.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'The best grain, the finest roast, the powerful flavor.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // The "Get Started" Button with your Navigation
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E), // Brown color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          final coffeeData = Coffee(
                            name: "Espresso Coffee",
                            description: "A cappuccino is an approximately 150 ml beverage...",
                            price: "\$ 4.53",
                            image: 'assets/images/coffee_detail.png',
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CoffeeDetailScreen(coffee: coffeeData),
                            ),
                          );
                        },
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
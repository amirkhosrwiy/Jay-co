import 'package:flutter/material.dart';
import 'package:gym/switch_account_screen.dart';
import 'package:lottie/lottie.dart';

class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({super.key});

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int _selectedIndex = 0;
  int _selectedFloatingIndex = 0; // برای نوار معلق

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildHomePage(), // ← جایگزین شده با صفحه اسکرولی
      _buildPage("Profile", Colors.green[300]!),
      _buildPage("Share", Colors.orange[300]!),
      _buildPage("Rate App", Colors.purple[300]!),
      _buildPage("Contact Us", Colors.red[300]!),
    ];
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom view.navigation"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SwitchAccountScreen()),
            );
          },
        ),
        backgroundColor: Color(0xff1C1F2E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 ۱. تبل‌های بالایی: Featured, Popular, Latest
            _buildTabs(),

            const SizedBox(height: 20),

            // 🔹 ۲. بخش Category
            _buildCategorySection(),
            const SizedBox(height: 20),
            PromoCarousel(),
            // 🔹 ۳. لیست محصولات
            _buildProductList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _buildTabButton("Featured", true),
        const SizedBox(width: 8),
        _buildTabButton("Popular", false),
        const SizedBox(width: 8),
        _buildTabButton("Latest", false),
      ],
    );
  }

  Widget _buildTabButton(String label, bool isSelected) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff63A361) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey[800],
              // fontFamily: 'Vazirmatn', // اگر فونت خاصی دارید
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // fontFamily: 'Vazirmatn',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(
                  color: Color(0xff63A361),
                  // fontFamily: 'Vazirmatn',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8, // تعداد آیتم‌ها
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        'assets/images/1a.png',
                      ), // ← جایگزین با تصویر واقعی
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Item $index",
                      style: TextStyle(
                        fontSize: 12,
                        // fontFamily: 'Vazirmatn',
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductList() {
    return Column(
      children: List.generate(4, (index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/2a.png', // ← جایگزین با تصویر واقعی
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vodafone Zoo Zoo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          // fontFamily: 'Vazirmatn',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Year 2020",
                        style: TextStyle(
                          color: Colors.grey[600],
                          // fontFamily: 'Vazirmatn',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            "Rate",
                            style: TextStyle(
                              color: Colors.grey[600],
                              // fontFamily: 'Vazirmatn',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: List.generate(5, (starIndex) {
                              return Icon(
                                Icons.star,
                                color: Color(0xff63A361),
                                size: 16,
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFAED6F1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Rs. 1,80,000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontFamily: 'Vazirmatn',
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffB7E5CD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(Icons.add, color: Colors.white, size: 24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPage(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xff1C1F2E), Color(0xff63A361)],
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [_getLottieAnimation(), _getContainerBox2()],
      ),
    );
  }

  Widget _getLottieAnimation() {
    return Positioned(
      top: 50,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          _showHelpSheet(context);
        },
        child: Lottie.asset(
          'assets/animations/404.json',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _getContainerBox2() {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1C1F2E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Text('MMM'),
            ),
          ),
        ),
      ],
    );
  }

  void _showHelpSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xff1C1F2E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text(
                'سلام من امیر هستم',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Vazirmatn',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'این تست اپلیکیشن مای جیم است',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                  height: 1.5,
                  // fontFamily: 'Vazirmatn',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff08CB00).withOpacity(0.4),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'بستن',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      // fontFamily: 'Vazirmatn',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFloatingBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topLeft,
          colors: [Color.fromARGB(255, 49, 54, 75), Color(0xff1C1F2E)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 7),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedFloatingIndex = index;
                // اگر بخواهید با این نوار، صفحه اصلی را هم تغییر دهید:
                _selectedIndex =
                    index; // ← اختیاری: اگر می‌خواهید صفحه هم عوض شود
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _selectedFloatingIndex == index
                        ? Color(0xff63A361)
                        : Color(0xffB7E5CD),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Icon(
                      _getIconForIndex(index),
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  _getLabelForIndex(index),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: _selectedFloatingIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _selectedFloatingIndex == index
                        ? Color(0xff63A361)
                        : Color(0xffB7E5CD),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.account_balance_wallet; // حساب من → کیف پول
      case 1:
        return Icons.bolt; // شارژ → برق
      case 2:
        return Icons.settings; // پیشنهادی → تنظیمات
      case 3:
        return Icons.arrow_downward; // خرید بسته → پایین
      case 4:
        return Icons.wallet; // جیب جت → کیف پول
      default:
        return Icons.home;
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return "حساب من";
      case 1:
        return "شارژ";
      case 2:
        return "پیشنهادی";
      case 3:
        return "خرید بسته";
      case 4:
        return "جیب جت";
      default:
        return "Home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            bottom: 20, // فاصله از پایین
            left: 16,
            right: 16,
            child: _buildFloatingBar(),
          ),
        ],
      ),
    );
  }
}

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  // لیست تصاویر برای اسلایدر
  final List<String> _images = [
    'assets/images/2a.png', // ← جایگزین با تصویر واقعی
    'assets/images/4a.png',
    'assets/images/3a.png',
    'assets/images/5a.png',
  ];

  @override
  void initState() {
    super.initState();
    // حرکت خودکار اسلایدر (اختیاری)
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _autoScroll();
      }
    });
  }

  void _autoScroll() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        (_currentPage + 1) % _images.length,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180, // ارتفاع مناسب برای اسلایدر
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff63A361), // آبی تیره
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          // اسلایدر تصاویر
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // ← عملیات کلیک روی هر آیتم
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Clicked on item $index')),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // متن سمت چپ
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buy, Sell, Exchange",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  // fontFamily: 'Vazirmatn', // اگر فونت خاصی دارید
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "All in one place",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  // fontFamily: 'Vazirmatn',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // تصویر دایره‌ای سمت راست
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(_images[index]),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // نشانگرهای اسلایدر (دایره‌های کوچک پایین)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

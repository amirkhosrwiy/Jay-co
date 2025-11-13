import 'package:flutter/material.dart';
import 'package:jay/switch_account_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // لیست داده‌های اسلایدر
  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'assets/images/men5.png', // جایگزین با مسیر تصویر خود
      title: 'خوش آمدید',
      description:
          'Grasp Core Concepts through In-Depth Lessons and Insightful Explanations',
      backgroundColor: Color(0xff1C1F2E), // رنگ پس‌زمینه صفحه ۱
    ),
    OnboardingPage(
      image: 'assets/images/wmen1.png', // جایگزین با مسیر تصویر خود
      title: 'Welcome to FlutterHub!',
      description:
          'Embark on a Transformative Journey into Dart and Flutter Development',
      backgroundColor: Color(0xff1C1F2E), // رنگ پس‌زمینه صفحه ۲
    ),
    OnboardingPage(
      image: 'assets/images/men1.png', // جایگزین با مسیر تصویر خود
      title: 'Practical Proficiency',
      description:
          'Immerse Yourself in Practical Learning with Real-World Dart and Flutter Projects',
      backgroundColor: Color(0xff1C1F2E), // رنگ پس‌زمینه صفحه ۳
    ),
    OnboardingPage(
      image: 'assets/images/wmen2.png', // جایگزین با مسیر تصویر خود
      title: 'Practical Proficiency',
      description:
          'Immerse Yourself in Practical Learning with Real-World Dart and Flutter Projects',
      backgroundColor: Color(0xff1C1F2E), // رنگ پس‌زمینه صفحه ۳
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _pages[_currentPage].backgroundColor,
              Color(0xff7F8CAA), // رنگ سفید در پایین برای ایجاد افکت مثلثی
            ],
          ),
        ),
        child: Column(
          children: [
            // بخش تصویر و محتوا
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // تصویر
                      Image.asset(
                        _pages[index].image,
                        height: MediaQuery.of(context).size.height * 0.5,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 40),
                      // عنوان
                      Text(
                        _pages[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2AADE5), // آبی روشن
                        ),
                      ),
                      SizedBox(height: 16),
                      // توضیحات
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          _pages[index].description,
                          textAlign: TextAlign.center,
                          // ⬇️ این خطوط مهم هستند:
                          textDirection: TextDirection
                              .ltr, // چون متن‌های شما انگلیسی هستند
                          style: TextStyle(
                            fontFamily:
                                'JameJam', // 👈 نام فونت شما (اگر فونت لاتین است، می‌توانید حذف کنید)
                            fontSize: 16,
                            height: 1.6, // فاصله خطوط بهتر
                            color: Colors.white70, // خوانا روی پس‌زمینه تیره
                            fontWeight: FontWeight.w400, // نرمال (نه پررنگ)
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // بخش پایینی (دکمه‌ها و نمایشگر صفحات)
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // دکمه Skip
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // یا به صفحه اصلی بروید
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),

                  // نمایشگر صفحات (دایره‌ها)
                  Row(
                    children: List.generate(_pages.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Color(0xFF2AADE5) // آبی روشن برای صفحه فعلی
                              : Colors.grey[300], // خاکستری برای بقیه
                        ),
                      );
                    }),
                  ),

                  // دکمه Next یا Done
                  _currentPage == _pages.length - 1
                      ? FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SwitchAccountScreen(),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_forward),
                          backgroundColor: Color(0xFF2AADE5),
                        )
                      : TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: Color(0xFF2AADE5)),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// کلاس مدل برای داده‌های هر صفحه
class OnboardingPage {
  final String image;
  final String title;
  final String description;
  final Color backgroundColor;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.backgroundColor,
  });
}

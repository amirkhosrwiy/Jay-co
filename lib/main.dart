import 'package:flutter/material.dart';
import 'dart:async';
import 'package:jay/switch_account_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headlineSmall: TextStyle(color: Colors.transparent, fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer(const Duration(seconds: 5), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SwitchAccountScreen()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // لغو timer وقتی Widget حذف می‌شود
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            repeat:
                ImageRepeat.repeat, // یا fit: BoxFit.cover اگر می‌خواهید پر کند
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Image.asset('assets/images/logo.png'), // ساده‌تر و بهتر
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    'from',
                    style: TextStyle(color: Color(0xff63A361), fontSize: 20),
                  ),
                  Text(
                    'AmirKhousravi',
                    style: TextStyle(color: Color(0xff63A361), fontSize: 20),
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

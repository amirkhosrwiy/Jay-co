import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:jay/nav_behavior.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phone;

  const OtpVerificationScreen({super.key, required this.phone});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    5,
    (_) => TextEditingController(),
  );

  bool _isVerified = false;

  void _submit() {
    final code = _otpControllers.map((c) => c.text).join();

    if (code.length != 5 || !RegExp(r'^\d{5}$').hasMatch(code)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('کد باید شامل 5 رقم باشد.')));
      return;
    }

    setState(() {
      _isVerified = true;
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const Bottom_Navigation()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Verify Code'),
        backgroundColor: const Color(0xff333446),
        foregroundColor: const Color(0xffEAEFEF),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffEAEFEF),
                    Color(0xff7F8CAA),
                    Color(0xff333446),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animations/robot.json', // ← فایل Lottie سبز
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    'کد 5 رقمی را وارد کنید',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '+98 ${widget.phone}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      return Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                            0.1,
                          ), // پس‌زمینه آینه‌ای
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3), // سایه تیره
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: const TextStyle(
                            color: Colors.white, // ← متن تایپ‌شده سفید
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                'YekanBakh', // ← فونت فارسی (باید در pubspec.yaml باشد)
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none, // ← بدون border اضافی
                            contentPadding: const EdgeInsets.all(0),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 4) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                            if (index == 4 && value.isNotEmpty) {
                              _submit();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: _submit,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xFF08CB00).withOpacity(0.4),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff1C1F2E).withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isVerified)
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Lottie.asset(
                  'assets/animations/accept.json',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

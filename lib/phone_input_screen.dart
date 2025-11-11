import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // برای inputFormatters
import 'package:flutter_svg/svg.dart';
import 'package:gym/otp_verification_screen.dart';
import 'package:lottie/lottie.dart'; // صفحه بعدی

class PhoneInputScreen extends StatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  State<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Enter Phone Number'),
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in to ',
                style: TextStyle(color: Color(0xff1C1F2E), fontSize: 20),
              ),
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 100,
                width: 100,
              ),
            ],
          ),
          Positioned(
            top: 75,
            left: 0,
            right: 0,
            height: 300,
            child: Lottie.asset(
              'assets/animations/QR Code Scanner.json', // ← فایل Lottie سبز
              width: 100,
              height: 100,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff1C1F2E),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SvgPicture.asset(
                            'assets/flags/iran_flag.svg',
                            height: 24,
                            width: 36,
                          ),
                        ),
                        const Text(
                          '+98',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style: TextStyle(
                              color:
                                  Colors.white, // ← رنگ متن هنگام تایپ (سفید)
                              fontSize: 20,
                              fontFamily: 'Vazirmatn', // ← فونت حین تایپ
                            ),
                            decoration: InputDecoration(
                              hintText: '9123456789',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      final phone = _phoneController.text.trim();
                      if (phone.isEmpty || phone.length != 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'لطفاً یک شماره 10 رقمی معتبر وارد کنید.',
                            ),
                          ),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OtpVerificationScreen(phone: phone),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(
                            0xFF08CB00,
                          ).withOpacity(0.4), // بدون const
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(
                              0xff1C1F2E9056,
                            ).withOpacity(0.3), // بدون const
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Send Code',
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
        ],
      ),
    );
  }
}

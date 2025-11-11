import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gym/phone_input_screen.dart';

void main() {
  runApp(MaterialApp(home: PhoneInputScreen()));
}

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        height: 352,
                        width: 340,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(234, 234, 239, 0.5),
                              Color.fromRGBO(51, 52, 70, 0.498),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 32),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff7F8CAA),
                                    blurRadius: 10,
                                    offset: Offset(1, 6), // Shadow position
                                  ),
                                ],
                                shape: BoxShape.circle, // دایره‌ای کردن کانتینر
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/logo.png',
                                  ), // مسیر عکس شما
                                  fit: BoxFit
                                      .cover, // عکس را به صورت پوشش کامل نمایش بده
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Amir Khosravi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 46,
                              width: 129,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                    0xff7F8CAA,
                                  ), // سبز مغز پسته‌ای
                                  foregroundColor: Colors.white, // متن سفید
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 4,
                                  shadowColor: Color.fromRGBO(
                                    0,
                                    0,
                                    0,
                                    0.3,
                                  ), // ✅ جایگزین withAlpha — مشکی با شفافیت 30%
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PhoneInputScreen(),
                                    ),
                                  );
                                },
                                child: Text('Confirm'),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'switch account',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don\'t have an account? / ',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

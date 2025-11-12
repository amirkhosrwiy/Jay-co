import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  Future<void> _launchURL(String urlString) async {
    final uri = Uri.parse(urlString);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication, // اول اپ خارجی، بعد مرورگر
        );
      } else {
        // اگر اپ خارجی وجود نداشت، در مرورگر باز شود
        await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطا در باز کردن لینک: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 20,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90),
            bottomRight: Radius.circular(90),
          ),
        ),
        title: Text(
          'درباره ما',
          style: TextStyle(
            shadows: [
              Shadow(
                blurRadius: 30.0,
                color: Colors.grey.shade300,
                offset: Offset(3.0, 2.0),
              ),
            ],
            color: Colors.white,
            fontSize: 40,
            fontFamily: 'IRAN',
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xff7F8CAA),
                Color(0xff333446),
                Color(0xff333446),
                Color(0xff7F8CAA),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 33, 39, 58),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/wall.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () =>
                      _launchURL('https://www.instagram.com/amirkhousravi'),
                  child: Image(
                    width: 70,
                    height: 70,
                    image: AssetImage('assets/images/instagram.png'),
                  ),
                ),
                InkWell(
                  onTap: () => _launchURL('https://github.com/amirkhosrwiy'),
                  child: Image(
                    width: 70,
                    height: 70,
                    image: AssetImage('assets/images/github.png'),
                  ),
                ),
                InkWell(
                  onTap: () => _launchURL(
                    'https://www.linkedin.com/in/amir-khosravi-0bb66a277/',
                  ),
                  child: Image(
                    width: 70,
                    height: 70,
                    image: AssetImage('assets/images/linkedin.png'),
                  ),
                ),
                InkWell(
                  onTap: () => _launchURL('https://t.me/expert_flutter'),
                  child: Image(
                    width: 70,
                    height: 70,
                    image: AssetImage('assets/images/telegram.png'),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 30,
            top: 420,
            child: Column(
              children: [
                Text('من را در شبکه های مجازی دنبال کنید', style: _textStyle),
                SizedBox(height: 5),
                Text(
                  'و نظرات و پیشنهدات خودرا\n   برای من ارسال کنید',
                  style: _textStyle,
                ),
                SizedBox(height: 5),
                Text(
                  'از حسن انتخاب شما\n    سپاسگذاریم',
                  style: _textStyle.copyWith(fontSize: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get _textStyle => TextStyle(
    color: Colors.white,
    fontFamily: 'IRAN',
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
}

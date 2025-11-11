import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({super.key});

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int _selectedFloatingIndex = 0;
  final String _qrData = "amir_khosravi_wallet_id_12345";

  // دکمه اسکن QR را اضافه می‌کنیم
  void _openScanner() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: MobileScanner(
                    onDetect: (capture) {
                      final barcodes = capture.barcodes;
                      if (barcodes.isNotEmpty) {
                        final String? code = barcodes.first.rawValue;
                        if (code != null) {
                          Navigator.of(context).pop(); // بستن BottomSheet

                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("کد اسکن شد!"),
                              content: Text(code),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(),
                                  child: Text("بستن"),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
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
                        ? Color(0xff7F8CAA)
                        : Color(0xffEAEFEF),
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
                        ? Color(0xff7F8CAA)
                        : Color(0xffEAEFEF),
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
        return Icons.qr_code;
      case 1:
        return Icons.history;
      case 2:
        return Icons.settings;
      case 3:
        return Icons.arrow_downward;
      case 4:
        return Icons.verified_user;
      default:
        return Icons.home;
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return "QR code";
      case 1:
        return "تاریخچه اسکنا";
      case 2:
        return "تنظیمات";
      case 3:
        return "دانلود مشخصات";
      case 4:
        return "درباره ما";
      default:
        return "Home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "QR کد شما برای اسکن",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: QrImageView(
                data: _qrData,
                version: QrVersions.auto,
                size: 200,
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "با اسکن این کد، دیگران می‌توانند به حساب شما دسترسی پیدا کنند.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _openScanner,
              icon: Icon(Icons.camera_alt, color: Colors.black),
              label: Text(
                "اسکن QR یا بارکد",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff7F8CAA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "این اپلیکیشن توسط امیر خسروی(کارشناسی کامپیوتر-دانشگاه آزاد اسلامی - واحد ورامبن) نوشته شده و تمامی حقوق محفوظ است",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildFloatingBar(),
      ),
    );
  }
}

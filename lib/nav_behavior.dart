import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({super.key});

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int _selectedFloatingIndex = 0;

  // متن QR Code — می‌توانید آن را به داده کاربر (مثلاً شناسه یا لینک) تغییر دهید
  final String _qrData =
      "amir_khosravi_wallet_id_12345"; // ← اینجا داده واقعی کاربر قرار می‌گیرد

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
        return Icons.account_balance_wallet;
      case 1:
        return Icons.bolt;
      case 2:
        return Icons.settings;
      case 3:
        return Icons.arrow_downward;
      case 4:
        return Icons.wallet;
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

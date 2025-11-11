import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(
    text: "Amir",
  );
  String? _profileImage = 'assets/images/user.png'; // ← عکس پیش‌فرض

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Color(0xff1C1F2E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // عکس پروفایل
            CircleAvatar(
              radius: 50,
              backgroundImage: _profileImage != null
                  ? AssetImage(_profileImage!)
                  : null,
              backgroundColor: Colors.grey[300],
              child: _profileImage == null
                  ? Icon(Icons.person, color: Colors.white, size: 40)
                  : null,
            ),
            const SizedBox(height: 20),

            // دکمه آپلود عکس
            ElevatedButton(
              onPressed: () {
                // در واقعیت: از ImagePicker استفاده می‌شود
                setState(() {
                  _profileImage =
                      'assets/images/men-scan.png'; // ← جایگزین با عکس جدید
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff08CB00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Upload Photo"),
            ),
            const SizedBox(height: 30),

            // فیلد نام
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xff1C1F2E).withOpacity(0.1),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // دکمه ذخیره
            Container(
              width: double.infinity,
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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Profile saved: ${_nameController.text}'),
                    ),
                  );
                },
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

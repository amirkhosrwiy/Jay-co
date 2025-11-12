import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ScanHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تاریخچه اسکنا"),
        backgroundColor: Color(0xff1C1F2E),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xff1C1F2E),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _loadScanHistory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xff7F8CAA)),
            );
          }

          final history = snapshot.data!;
          if (history.isEmpty) {
            return Center(
              child: Text(
                "هیچ کدی اسکن نشده است.",
                style: TextStyle(color: Colors.grey[400]),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[index];
              final code = item['code'] ?? '';
              final timestampStr = item['timestamp'] ?? '';
              final dateTime = DateTime.tryParse(timestampStr);
              final formattedDate = dateTime != null
                  ? "${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')} - ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}"
                  : "تاریخ نامعتبر";

              return Card(
                color: Color(0xff2A2D3F),
                child: ListTile(
                  title: Text(code, style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                    "تاریخ: $formattedDate",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Map<String, String>>> _loadScanHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final String? json = prefs.getString('scan_history_json');
    if (json == null) return [];

    final List<dynamic> list = jsonDecode(json);
    return list.map((e) => Map<String, String>.from(e)).toList();
  }
}

import 'package:flutter/material.dart';

class ResponseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? response = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(title: Text("Response")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            response ?? "No response received",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

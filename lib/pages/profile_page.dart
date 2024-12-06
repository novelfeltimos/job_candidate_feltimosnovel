import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recruiter Profile')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/home/cdukendc/Pictures/profile.jpeg'),
              ),
              const SizedBox(height: 16),
              Text('Name: Novel Feltimos', style: const TextStyle(fontSize: 18)),
              Text('Email: novelfeltimos@gmail.com', style: const TextStyle(fontSize: 18)),
              Text('Position: HR Manager', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

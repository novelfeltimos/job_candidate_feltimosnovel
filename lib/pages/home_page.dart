import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              icon: Icon(Icons.person),
              label: Text('Profile'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/candidates'),
              icon: Icon(Icons.group),
              label: Text('Candidates'),
            ),
          ],
        ),
      ),
    );
  }
}

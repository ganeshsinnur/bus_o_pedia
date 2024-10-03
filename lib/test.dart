/*
import 'package:flutter/cupertino.dart';


Widget hello =SafeArea(
  child: Column(
    children: [
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bus-o-Pedia',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Kolkata',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),

      // Search Form Section
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // From Field
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.directions_bus),
                  labelText: 'From',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // To Field
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.directions_bus),
                  labelText: 'To',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Search Button
              ElevatedButton(
                onPressed: () {
                  // Implement search functionality here
                },
                style: ElevatedButton.styleFrom(
                  //primary: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Search Buses',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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
*/


/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background color split
            Column(
              children: [
                // First 40% of the screen with one color
                Expanded(
                  flex: 4, // 40% of the screen
                  child: Container(
                    color: Colors.blue, // Change this to your desired color
                  ),
                ),
                // Remaining 60% of the screen with another color
                Expanded(
                  flex: 6, // 60% of the screen
                  child: Container(
                    color: Colors.green, // Change this to your desired color
                  ),
                ),
              ],
            ),
            // Foreground content
            Center(
              child: Text(
                'Your App Content Here',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/







/*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),*/
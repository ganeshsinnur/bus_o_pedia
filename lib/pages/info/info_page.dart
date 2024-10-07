import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kolkata bus-o-pedia, aka KBOP, is the largest bus fanning organization in Eastern India.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10.0),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'With over ',
                  ),
                  TextSpan(
                    text: '3,75,000 followers',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' and a monthly social media reach of ',
                  ),
                  TextSpan(
                    text: 'over 7 Million',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                    ', we work to popularise the necessity of buses and trams as the most important means of public transport. Kolkata is a unique city with a variety of modes of public transportation.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'We have been working since 2018 with all the stakeholders (operators, passengers, and staff) of buses and trams to ensure the smooth functioning and operation of these unsung heroes of the city.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Currently, we are based in ',
                  ),
                  TextSpan(
                    text: '8 districts',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                    ' of West Bengal, namely, Kolkata, Howrah, Hooghly, South 24 Parganas, North 24 Parganas, Purba Bardhaman, Malda, and North Dinajpur.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Note: We do not operate any bus or tram routes.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16.0,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'V1.0\n©2024',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

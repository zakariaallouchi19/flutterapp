import 'package:flutter/material.dart';
import 'policy.dart';
import 'profil.dart';

class Notif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de matches réservés'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/soocer.jpg', // Assurez-vous que le chemin est correct
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: [
                      MatchCard(
                        title: 'uemf staduim',
                        date: '17 Nov 2024, 16:50-18:50',
                        status: 'Cancelled',
                        imagePath: 'assets/images/zakaria.jpg',
                      ),
                      MatchCard(
                        title: 'uemf staduim ',
                        date: '17 Nov 2024, 18:50-20:50',
                        status: 'Cancelled',
                        imagePath: 'assets/images/ayman.jpg',
                      ),
                      MatchCard(
                        title: 'uemf staduim',
                        date: '17 Nov 2024, 18:55-20:55',
                        status: '',
                        imagePath: 'assets/images/achraf.jpg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add_rounded),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.policy),
            label: 'Policy',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          // Handle bottom navigation bar taps
          _onItemTapped(context, index);
        },
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navigate to ProfilePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      case 1:
        // Current page is Notification Page
        // No action needed since already on Notification Page
        break;
      case 2:
        // Navigate to PolicyPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PolicyPage()),
        );
        break;
    }
  }
}

class MatchCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final String imagePath;

  const MatchCard({
    Key? key,
    required this.title,
    required this.date,
    required this.status,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(imagePath, width: 100, height: 100), // Image à gauche
            SizedBox(width: 16.0), // Espacement entre l'image et le texte
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(date),
                  if (status.isNotEmpty) ...[
                    SizedBox(height: 8.0),
                    Text(
                      status,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


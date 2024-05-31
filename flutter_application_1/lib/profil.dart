import 'package:flutter/material.dart';
import 'policy.dart';
import 'notification.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/achraf.jpg'), // Change to your profile image path
            ),
            SizedBox(height: 20),
            Text(
              'Achraf Tayibi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'etablissement Eidia',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            Divider(
              height: 40,
              thickness: 2,
              indent: 50,
              endIndent: 50,
            ),
            InfoCard(
              icon: Icons.height,
              label: 'Taille',
              value: '173 cm',
            ),
            InfoCard(
              icon: Icons.school,
              label: 'Matricule Universitaire',
              value: '123456789',
            ),
            InfoCard(
              icon: Icons.numbers,
              label: 'Nombre de reservation',
              value: '13',
            ),
          
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add_rounded),
            label: 'notification',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.policy),
            label: 'Policy',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          _onItemTapped(context, index);
        },
      ),
    );
  }
  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
      //// Current page is Profile Page
      
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
        
      case 1:
        // Current page is Profile Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Notif()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PolicyPage()),
        );
        break;
      
    }
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  InfoCard({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blueAccent,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



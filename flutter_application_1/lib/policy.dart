import 'package:flutter/material.dart';
import 'profil.dart';
import 'notification.dart';

class PolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policy'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/uemf.jpg', // Change to your top image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '''
°LES MATCHES SONT RESERVÉS UN JOUR AVANT
°LA DURÉE DE MATCH 1H30M
°LE NOMBRE DE MEMBRE DE L'EQUIPE EST 5
UN SEUL MATCH EST RESERVÉ DANS LE JOUR
              ''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/soocer2.jpg', // Change to your background image path
                    fit: BoxFit.cover,
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
            label: 'profile',
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
        currentIndex: 2,
        onTap: (index) {
          _onItemTapped(context, index);
        }
      ),
    );
  }
  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Notif(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PolicyPage(),
          ),
        );
        break;
      
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/notification.dart';
import 'policy.dart';
import 'profil.dart';



class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          // Background image
          Image.network(
            'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          // Form content with padding
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // White background with some transparency
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.black), // Text color
                        ),
                        style: TextStyle(color: Colors.black), // Text color
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.black), // Text color
                        ),
                        style: TextStyle(color: Colors.black), // Text color
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.black), // Text color
                        ),
                        style: TextStyle(color: Colors.black), // Text color
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _confirmPassword = value!;
                        },
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Signing up...')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Button color
                          foregroundColor: Colors.white, // Text color
                        ),
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
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
            icon: Icon(Icons.no_accounts_rounded),
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
        onTap: (index) {
          _onItemTapped(context, index);
        },
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navigate to Profile Page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(), // Implement ProfilePage
          ),
        );
        break;
      case 1:
        // Navigate to Users Page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Notif(), // Implement UsersPage
          ),
        );
        break;
      case 2:
        // Navigate to Categories Page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PolicyPage(), // Implement CategoriesPage
          ),
        );
        break;
      
    }
  }
}


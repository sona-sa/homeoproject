import 'package:flutter/material.dart';
import 'package:hdmp/staff_dashboard.dart';
import 'package:hdmp/doctor_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Check if username and password are empty
    if (username.isEmpty || password.isEmpty) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username or password can\'t be null')),
      );
      return; // Exit the function if fields are empty
    }

    // Check credentials for Doctor and Staff
    if (username == 'doctor' && password == 'doctormadathil@123') {
      // Navigate to Doctor Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DoctorDashboard()),
      );
    } else if (username == 'staff' && password == 'staffkannur@123') {
      // Navigate to Staff Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StaffDashboard()),
      );
    } else {
      // Show error message for invalid credentials
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

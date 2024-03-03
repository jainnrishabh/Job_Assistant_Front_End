import 'package:flutter/material.dart';
import 'package:jobaiassitant/utilites/utility.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Check if email cookie is present
    _checkEmailCookie();
  }

  void _checkEmailCookie() async {
    try {
      // Get email cookie
      var cookies = await Utility.getCookies('userId');
      if (cookies != null && cookies.isNotEmpty) {
        // If email cookie is present, navigate to the dashboard page
        _navigateToDashboard();
      } else {
        // If email cookie is not present, navigate to the login page
        _navigateToLogin();
      }
    } catch (e) {
      Utility.logout(context);
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _navigateToDashboard() {
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator
      ),
    );
  }
}

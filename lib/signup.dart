import 'package:flutter/material.dart';
import 'package:jobaiassitant/user.model.dart';
import 'package:jobaiassitant/utilites/utility.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration:
                  InputDecoration(labelText: 'Email', errorText: emailError),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password', errorText: passwordError),
            ),
            SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  errorText: confirmPasswordError),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate fields
                if (_validateFields()) {
                  // Store data to cookies
                  Utility.storeCookie('email', emailController.text);
                  Utility.storeCookie('password', passwordController.text);

                  // Navigate to the next screen

                  User user = User(
                    email: emailController.text,
                    password: passwordController.text,
                    firstName: '', // Add additional fields as needed
                    lastName: '', // Add additional fields as needed
                    confirmPassword: confirmPasswordController.text,
                    addressLine1: '', // Add additional fields as needed
                    city: '', // Add additional fields as needed
                    state: '', // Add additional fields as needed
                    postalCode: '', // Add additional fields as needed
                    phoneDeviceType: '', // Add additional fields as needed
                    countryCode: '', // Add additional fields as needed
                    phoneNumber: '', // Add additional fields as needed
                    resumes: [], // Initialize resumes list
                    availabilityStartDate:
                        '', // Add additional fields as needed
                    preferredWorkSchedule:
                        '', // Add additional fields as needed
                    salaryExpectations: '', // Add additional fields as needed
                    desiredSalary: '', // Add additional fields as needed
                    salaryHistory: '', // Add additional fields as needed
                    workAuthorization: '', // Add additional fields as needed
                    sponsorshipRequired: '', // Add additional fields as needed
                    fullOrPartTimeAvailability:
                        '', // Add additional fields as needed
                    felonyConviction: '', // Add additional fields as needed
                    misdemeanorConviction:
                        '', // Add additional fields as needed
                    relatedConviction: '', // Add additional fields as needed
                    minorityMember: '', // Add additional fields as needed
                    disability: '', // Add additional fields as needed
                    interestPosition: '', // Add additional fields as needed
                    fitRole: '', // Add additional fields as needed
                    challengingSituation: '', // Add additional fields as needed
                  );

                  // Pass User instance to the next screen
                  Navigator.pushNamed(context, '/register', arguments: user);
                }
              },
              child: Text('Signup'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateFields() {
    bool isValid = true;

    // Email validation
    if (emailController.text.isEmpty) {
      setState(() {
        emailError = 'Please enter your email';
      });
      isValid = false;
    } else {
      setState(() {
        emailError = null;
      });
    }

    // Password validation
    if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = 'Please enter your password';
      });
      isValid = false;
    } else {
      setState(() {
        passwordError = null;
      });
    }

    // Confirm Password validation
    if (confirmPasswordController.text.isEmpty) {
      setState(() {
        confirmPasswordError = 'Please confirm your password';
      });
      isValid = false;
    } else if (confirmPasswordController.text != passwordController.text) {
      setState(() {
        confirmPasswordError = 'Passwords do not match';
      });
      isValid = false;
    } else {
      setState(() {
        confirmPasswordError = null;
      });
    }

    return isValid;
  }
}

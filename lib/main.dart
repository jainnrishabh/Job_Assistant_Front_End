import 'package:flutter/material.dart';
import 'package:jobaiassitant/dashboard.dart';
import 'package:jobaiassitant/login.dart';
import 'package:jobaiassitant/register.dart';
import 'package:jobaiassitant/resumeUpload.dart';
import 'package:jobaiassitant/signup.dart';
import 'package:jobaiassitant/splashScreen.dart';
import 'package:jobaiassitant/user.model.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  User user = User(
    email: '',
    password: '',
    firstName: '', // Add additional fields as needed
    lastName: '', // Add additional fields as needed
    confirmPassword: '',
    addressLine1: '', // Add additional fields as needed
    city: '', // Add additional fields as needed
    state: '', // Add additional fields as needed
    postalCode: '', // Add additional fields as needed
    phoneDeviceType: '', // Add additional fields as needed
    countryCode: '', // Add additional fields as needed
    phoneNumber: '', // Add additional fields as needed
    resumes: [], // Initialize resumes list
    availabilityStartDate: '', // Add additional fields as needed
    preferredWorkSchedule: '', // Add additional fields as needed
    salaryExpectations: '', // Add additional fields as needed
    desiredSalary: '', // Add additional fields as needed
    salaryHistory: '', // Add additional fields as needed
    workAuthorization: '', // Add additional fields as needed
    sponsorshipRequired: '', // Add additional fields as needed
    fullOrPartTimeAvailability: '', // Add additional fields as needed
    felonyConviction: '', // Add additional fields as needed
    misdemeanorConviction: '', // Add additional fields as needed
    relatedConviction: '', // Add additional fields as needed
    minorityMember: '', // Add additional fields as needed
    disability: '', // Add additional fields as needed
    interestPosition: '', // Add additional fields as needed
    fitRole: '', // Add additional fields as needed
    challengingSituation: '', // Add additional fields as needed
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: routing,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

  Route<dynamic>? routing(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return PageTransition(
            child: LoginScreen(), type: PageTransitionType.rightToLeftWithFade);

      case '/signup':
        return PageTransition(
            child: SignupScreen(),
            type: PageTransitionType.rightToLeftWithFade);

      case '/register':
        return PageTransition(
            child: RegisterScreen(data: settings.arguments as User?),
            type: PageTransitionType.rightToLeftWithFade);

      case '/uploadResume':
        return PageTransition(
            child: ResumeUploader(data: settings.arguments as User?),
            type: PageTransitionType.rightToLeftWithFade);

      case '/dashboard':
        return PageTransition(
            child: DashboardScreen(),
            type: PageTransitionType.rightToLeftWithFade);

      default:
        return null;
    }
  }
}

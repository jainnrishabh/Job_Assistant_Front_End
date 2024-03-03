import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobaiassitant/job.model.dart';
import 'package:jobaiassitant/user.model.dart';
import 'package:jobaiassitant/utilites/constants.dart';
import 'package:jobaiassitant/utilites/utility.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = true;
  List<JobModel> jobs = [];
  User userData = User(
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
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var cookies = await Utility.getCookies('userId');

      var headersList = {
        'Accept': '*/*',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
      };

      var constUrl = Constants.docUrl;

      var url = Uri.parse('$constUrl/api/data/$cookies');

      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      User user = User.fromJson(jsonDecode(resBody));
      userData = user;

      getJobData(userData.resumes[0]['fileId']);

      setState(() {});
    } on Exception catch (e) {
      isLoading = false;

      setState(() {});
      print(e);
    }

    // if (res.statusCode >= 200 && res.statusCode < 300) {
    //   print(resBody);
    // } else {
    //   print(res.reasonPhrase);
    // }
  }

  getJobData(resume) async {
    try {
      var headersList = {
        'Accept': '*/*',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      };

      var url = Uri.parse('http://128.4.126.32:8000/$resume');
      var req = http.Request('GET', url);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        final jsonData = jsonDecode(resBody);

        // Parsing job data to WalmartJob model

        for (var jobJson in jsonData) {
          jobs.add(JobModel.fromJson(jobJson));
        }

        isLoading = false;
        setState(() {});
      } else {
        isLoading = false;

        setState(() {});
        print(res.reasonPhrase);
      }
    } on Exception catch (e) {
      isLoading = false;

      setState(() {});
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Perform signout logic
              _signout(context);
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return jobDetailsTile(jobs[index], userData.resumes, context);
              },
            ),
    );
  }

  void _signout(BuildContext context) {
    // Delete all cookies
    Utility.logout(context);

    // Navigate to the login page
    Navigator.pushReplacementNamed(context, '/login');
  }

  jobDetailsTile(job, resumes, context) {
    bool _expanded = false;
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Position name: ${job.title}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('Company: ${job.company}'),
            SizedBox(height: 4),
            Text('Place: ${job.location}'),
            SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                crossFadeState: _expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: Text(
                  'Job Desc: ${job.description.substring(0, 100)}...',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                secondChild: Text(
                  'Job Desc: ${job.description}',
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Match: ${job.matchScore.toStringAsFixed(2)}%'),
                Text('Posted On: ${job.postedOn}'),
              ],
            ),
            SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {
                _apply(context, resumes);
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  void _apply(BuildContext context, List<Map<String, String>> resumes) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Apply with Resume'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(resumes.length, (index) {
              return ListTile(
                title: Text('Resume ${index + 1}'),
                onTap: () {
                  // Apply with the selected resume logic
                  // Here, you can use 'resumes[index]' to access the selected resume data
                  Navigator.pop(context);
                },
              );
            }),
          ),
        );
      },
    );
  }
}

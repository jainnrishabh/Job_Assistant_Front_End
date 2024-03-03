import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jobaiassitant/user.model.dart';
import 'package:http/http.dart' as http;
import 'package:jobaiassitant/utilites/constants.dart';
import 'package:jobaiassitant/utilites/utility.dart';

class ResumeUploader extends StatefulWidget {
  final data;
  ResumeUploader({this.data});
  @override
  _ResumeUploaderState createState() => _ResumeUploaderState();
}

class _ResumeUploaderState extends State<ResumeUploader> {
  List<Map<String, String>> _selectedResumes = [];

  User? user;

  @override
  void initState() {
    super.initState();
    user = widget.data;
    setState(() {});
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt'],
    );

    // Check if a file is picked
    if (result != null) {
      Uint8List uploadFileBytes = result.files.single.bytes!;

      List<int> fileBytes = uploadFileBytes;

      String base64String = base64Encode(fileBytes);

      // Example of other data to be sent to MongoDB
      Map<String, dynamic> data = {
        'name': 'File',
        'type': 'pdf',
        'content': base64String, // Add Base64 string to your data
      };

      var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
      var constUrl = Constants.docUrl;
      var url = Uri.parse('$constUrl/upload/pdf');

      var body = {"pdf_data": base64String};

      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();

      final resBody = await res.stream.bytesToString();

      print(resBody);

      if (res.statusCode >= 200 && res.statusCode < 300) {
        print(resBody);
      } else {
        print(res.reasonPhrase);
      }

      _selectedResumes.add({
        'filename': result.files.single.name,
        'fileId': jsonDecode(resBody)["file_id"]
      });
      user?.resumes = _selectedResumes;

      setState(() {});
    }
  }

  void _removeFile(int index) {
    setState(() {
      _selectedResumes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text('Select Resumes'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedResumes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Resume ${index + 1}'),
                    subtitle: Text(_selectedResumes[index]["filename"]!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeFile(index),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Make POST request
                  postUserData(context, user);
                  // Navigate to the dashboard page
                },
                child: Text('Go to Dashboard'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postUserData(context, var userData) async {
    final url = Uri.parse('http://128.4.118.79:5000/store_data');

    try {
      var body = json.encode(userData);
      var res = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: body,
      );

      Map<String, dynamic> data = jsonDecode(res.body);

      // Access the value associated with the 'inserted_id' key
      String insertedId = data['inserted_id'];

      Utility.storeCookie('userId', insertedId);

      Navigator.pushReplacementNamed(context, '/dashboard');
    } catch (e) {
      // Handle error
      print(e);
    }
  }
}

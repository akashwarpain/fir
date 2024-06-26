import 'package:fire/screens/chat.dart';
import 'package:fire/screens/profilescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Upload {
  String name;
  String uploader;
  int year;

  Upload({required this.name, required this.uploader, required this.year});
}

class HomeScreen extends StatelessWidget {
  final List<Upload> uploads = [
    Upload(name: 'Project 1', uploader: 'John Doe', year: 2024),
    Upload(name: 'Project 2', uploader: 'Jane Smith', year: 2023),
    Upload(name: 'Project 3', uploader: 'John Doe', year: 2024),
    Upload(name: 'File 1', uploader: 'Alice Johnson', year: 2022),
    Upload(name: 'File 2', uploader: 'John Doe', year: 2023),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Knowledge Repository:)'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Uploads',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: uploads.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(uploads[index].name),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Uploaded Files',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: uploads.length,
              itemBuilder: (BuildContext context, int index) {
                final upload = uploads[index];
                return ListTile(
                  title: Text(upload.name),
                  subtitle: Text(
                    '${upload.uploader} - ${upload.year}',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to the home screen or perform any other action
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen(
                            username: '',
                            imageUrl: '',
                            email: '',
                            rollNumber: '',
                            batch: '',
                            course: '',
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Color.fromARGB(255, 155, 34, 109),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        toolbarTextStyle: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).bodyText2,
        titleTextStyle: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).headline6,
      ),
      bottomAppBarColor: Colors.blue,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ).copyWith(secondary: Colors.white),
    ),
    home: HomeScreen(),
  ));
}

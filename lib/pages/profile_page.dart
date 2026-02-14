import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logout() {
    print("logging out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("profile page"),
            Spacer(),
            ElevatedButton(child: Text("Sign out"), onPressed: logout),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

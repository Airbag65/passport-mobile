import 'package:flutter/material.dart';
import 'package:passport_mobile/pages/login_page.dart';
import 'package:passport_mobile/util/network_manager.dart';
import 'package:passport_mobile/util/storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logout(BuildContext context) {
    requestSignOut().then((value) {
      if (value != null) {
        removeLocalAuth();
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("PROFILE PAGE"),
            Text("Some exciting stuff will eventually happen here"),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                logout(context);
              },
              child: Text("Sign out"),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

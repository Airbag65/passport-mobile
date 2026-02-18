import 'package:flutter/material.dart';
import 'package:passport_mobile/util/encryption.dart';
import 'package:passport_mobile/util/network_manager.dart';

class AddPasswordPage extends StatefulWidget {
  const AddPasswordPage({super.key});

  @override
  State<AddPasswordPage> createState() => _AddPasswordPageState();
}

class _AddPasswordPageState extends State<AddPasswordPage> {
  final hostController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 75,
              padding: EdgeInsetsGeometry.only(top: 40),
              child: Text("Add new password"),
            ),
            SizedBox(
              width: 350,
              height: 75,
              child: TextField(
                controller: hostController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Host",
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 75,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 75,
              child: TextField(
                controller: confirmPasswordController,
                onChanged: (value) {
                  setState(() {
                    if (value != passwordController.text) {
                      errorMessage = "Passwords must match!";
                    } else if (value == "" ||
                        value == passwordController.text) {
                      errorMessage = "";
                    }
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Confirm password",
                ),
              ),
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
            ElevatedButton(
              child: Text("Add password"),
              onPressed: () {
                if (passwordController.text != confirmPasswordController.text) {
                  return;
                }
                uploadNewPassword(
                  hostController.text,
                  passwordController.text,
                ).then((value) {
                  if (value) {
                    SnackBar sb = SnackBar(content: Text("New password added"));
                    ScaffoldMessenger.of(context).showSnackBar(sb);
                  } else {
                    SnackBar sb = SnackBar(
                      content: Text("Something went wrong"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(sb);
                  }
                  hostController.text = "";
                  passwordController.text = "";
                  confirmPasswordController.text = "";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

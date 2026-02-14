import 'package:flutter/material.dart';
import 'package:passport_mobile/main.dart';
import 'package:passport_mobile/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = "";

  void login(BuildContext ctx) async {
    LoginProvider provider = Provider.of<LoginProvider>(ctx, listen: false);
    if (!await provider.login(
      _emailController.text,
      _passwordController.text,
    )) {
      setState(() {
        errorMessage = "Wrong email or password!";
      });
      return;
    }
    Navigator.pop(ctx);
    Navigator.push(ctx, MaterialPageRoute<void>(builder: (ctx) => Passport()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PASSPORT",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 350,
              height: 75,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 75,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {login(context)},
              child: Text("Login"),
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

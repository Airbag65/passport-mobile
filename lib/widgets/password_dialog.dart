import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordDialog extends StatelessWidget {
  const PasswordDialog({
    super.key,
    required String hostName,
    required String password,
  }) : _hostName = hostName,
       _password = password;

  final String _hostName;
  final String _password;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_hostName),
      content: Container(
        height: 40,
        padding: EdgeInsetsGeometry.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 240),
          border: Border.all(
            color: Color.fromARGB(175, 175, 175, 175),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(175, 175, 175, 175),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_password, style: GoogleFonts.googleSansCode()),
            Transform.translate(
              offset: Offset(0, -7),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.copy_rounded,
                  size: 20,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordDialog extends StatefulWidget {
  const PasswordDialog({
    super.key,
    required String hostName,
    required String password,
  }) : _hostName = hostName,
       _password = password;

  final String _hostName;
  final String _password;

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  String shownString = "";

  @override
  void initState() {
    setState(() {
      shownString = "*" * widget._password.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget._hostName),
      content: Container(
        height: 40,
        padding: EdgeInsetsGeometry.only(
          left: 10,
          right: 10,
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
            GestureDetector(
              onTap: () {
                setState(() {
                  if (shownString == widget._password) {
                    shownString = "*" * widget._password.length;
                  } else {
                    shownString = widget._password;
                  }
                });
              },
              child: Text(shownString, style: GoogleFonts.googleSansCode()),
            ),
            Transform.translate(
              offset: Offset(0, -7),
              child: IconButton(
                onPressed: () async {
                  try {
                    await FlutterClipboard.copy(widget._password);
                    Navigator.of(context).pop();
                    SnackBar sb = SnackBar(
                      content: Text(
                        "Copied password for '${widget._hostName}' to clipboard",
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(sb);
                  } on ClipboardException catch (e) {
                    print("Something went wrong: ${e.message}");
                  }
                },
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

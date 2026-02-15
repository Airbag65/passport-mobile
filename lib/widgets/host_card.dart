import 'package:flutter/material.dart';
import 'package:passport_mobile/models/get_password_models.dart';
import 'package:passport_mobile/util/network_manager.dart';
import 'package:passport_mobile/widgets/password_dialog.dart';

class HostCard extends StatelessWidget {
  const HostCard({super.key, required String hostName}) : _hostName = hostName;

  Future<void> dialogBuilder(BuildContext context) async {
    GetPasswordResponse? password = await requestPasswordWithHost(_hostName);
    SnackBar snackbar = SnackBar(
      content: Text("Something went wrong"),
      action: SnackBarAction(label: "OK", onPressed: () {}),
    );
    if (password?.password == null) {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }
    // TODO: Maybe add biometric signature to access password
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PasswordDialog(
          hostName: _hostName,
          password: password!.password,
        );
      },
    );
  }

  final String _hostName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      padding: EdgeInsets.all(20),
      height: 75,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 245),
        border: Border.all(width: 1, color: Color.fromARGB(175, 175, 175, 175)),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(175, 175, 175, 175),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_hostName, style: TextStyle(fontSize: 20)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {
                  dialogBuilder(context);
                  // print("Showing $_hostName");
                },
              ),
              IconButton(
                onPressed: () {
                  print("Remving $_hostName");
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

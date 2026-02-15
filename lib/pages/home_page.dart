import 'package:flutter/material.dart';
import 'package:passport_mobile/util/network_manager.dart';
import 'package:passport_mobile/widgets/host_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> hosts = [];
  @override
  void initState() {
    getPasswordHosts()
        .then((value) {
          setState(() {
            hosts = value;
          });
        })
        .catchError((e) {
          hosts = [];
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: hosts.length,
                itemBuilder: (BuildContext context, int index) {
                  return HostCard(hostName: hosts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

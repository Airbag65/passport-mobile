import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:passport_mobile/pages/login_page.dart';
import 'package:passport_mobile/providers/login_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await initLocalStorage();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = LoginProvider();
    Widget startPage;
    if (loginProvider.isLoggedIn) {
      startPage = Passport();
    } else {
      startPage = LoginPage();
    }
    return Consumer<LoginProvider>(
      builder: (context, _, _) {
        return MaterialApp(
          title: 'PASSPORT',
          theme: ThemeData(
            colorScheme: .fromSeed(
              seedColor: Color.fromARGB(255, 33, 170, 255),
            ),
          ),
          home: startPage,
        );
      },
    );
  }
}

class Passport extends StatefulWidget {
  const Passport({super.key});

  @override
  State<Passport> createState() => _PassportState();
}

class _PassportState extends State<Passport> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("PASSPORT"),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(
            label: "Add password",
            selectedIcon: Icon(Icons.add_circle),
            icon: Icon(Icons.add_circle_outline_rounded),
          ),
          NavigationDestination(
            label: "Home",
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
          ),
          NavigationDestination(
            label: "Profile",
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
      body: <Widget>[Text("1"), Text("2"), Text("3")][currentPage],
    );
  }
}

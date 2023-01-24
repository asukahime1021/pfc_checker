import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pfc/db/db.dart';
import 'package:pfc/pages/achivement_page.dart';
import 'package:pfc/pages/list_page.dart';

import 'pages/register_page.dart';

const String title = 'PFC Balance Checker';
final StateProvider<List<Food>> foodProvider = StateProvider<List<Food>>((ref) => []);
final StateProvider<List<Eated>> eatedProvider = StateProvider<List<Eated>>((ref) => []);
final StateProvider<Achivement?> achievementProvider = StateProvider<Achivement?>((ref) => null);
PfcDatabase database = PfcDatabase();

void main() {  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Noto Sans JP"
      ),
      home: const MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentScreenIndex = 0;
  final List<Widget> screenList = [
    ItemListPage(),
    RegisterPage(),
    AchievementPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: screenList[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "トップ"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "食べ物"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "目標")
        ],
        currentIndex: currentScreenIndex,
        onTap: (int index) {
          setState(() {
            currentScreenIndex = index;
          });
        },
      ),
    );
  }
}

bool isNumeric(String? s) {
  if (s == null) {
    return true;
  }
  return double.tryParse(s) != null;
}

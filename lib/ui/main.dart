import 'package:flutter/material.dart';
import 'package:flutter_space_x/core/manager/database_manager.dart';
import 'package:flutter_space_x/ui/component/history.dart';
import 'package:flutter_space_x/ui/component/spacex_info.dart';
import 'package:flutter_space_x/ui/maps.dart';
import 'package:provider/provider.dart';

import '../core/manager/locator.dart';
import '../core/viewModel/HomeViewModel.dart';
import 'component/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await locator<DatabaseManager>().main();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, HomeViewModel model, child) => MaterialApp(
          title: 'SpaceX',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'SpaceX'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int selectedIndex = 1;
  final Widget _history = History();
  final Widget _home = Home();
  final Widget _spacexInfo = SpacexInfo();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Maps();
                        },
                      ),
                  );
                },
                child: const Icon(
                  Icons.map_outlined,
                  size: 26.0,
                ),
              ))
        ],
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "SpaceX")
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return _history;
    } else if (selectedIndex == 1) {
      return _home;
    } else {
      return _spacexInfo;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

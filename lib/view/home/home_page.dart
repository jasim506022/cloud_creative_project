import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  int _currentIndex = 0;
  bool _isExpanded = false;

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(child: Text("Selected Page: $_currentIndex")),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isExpanded)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _extraItem(Icons.settings, "Settings"),
                  _extraItem(Icons.notifications, "Alerts"),
                  _extraItem(Icons.help, "Help"),
                ],
              ),
            ),
          ConvexAppBar(
            style: TabStyle.reactCircle,
            items: [
              TabItem(icon: Icons.home, title: "Home"),
              TabItem(icon: Icons.search, title: "Search"),
              TabItem(icon: Icons.add_circle, title: ""),
              TabItem(icon: Icons.favorite, title: "Favorites"),
              TabItem(icon: Icons.person, title: "Profile"),
            ],
            initialActiveIndex: _currentIndex,
            onTap: (index) {
              if (index == 2) {
                setState(() => _isExpanded = !_isExpanded);
              } else {
                setState(() {
                  _currentIndex = index;
                  _isExpanded = false;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _extraItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: Colors.blue),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }
}
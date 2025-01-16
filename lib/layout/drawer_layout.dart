import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerLayout extends StatefulWidget {
  const DrawerLayout({super.key, required this.title});

  final String title;

  @override
  State<DrawerLayout> createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: ListView(
          children: [
            ListTile(
              title: Text("个人中心"),
              onTap: () {
                if (kDebugMode) {
                  print("点击了个人中心");
                }
              },
            ),
            ListTile(
              title: Text("联系我们"),
              onTap: () {
                if (kDebugMode) {
                  print("点击了联系我们");
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

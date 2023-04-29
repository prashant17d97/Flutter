import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          )),
      darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          )),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        /*decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://images.ui8.net/uploads/frame-6_1661537769747.png"),
              fit: BoxFit.cover,
            ),
          ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Text(
                    'You have pushed the button $_counter times:',
                  ),
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    // hoverElevation: 2.5,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierLabel: "Prashant",
                  barrierColor: Colors.black54,
                  useSafeArea: false,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Alert'),
                      content: Text('This is an alert message.',
                          style: Theme.of(context).textTheme.headline1),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Show Alert'),
            ),
            Image.network(
              "https://images.ui8.net/uploads/frame-6_1661537769747.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Image.network(
              "https://images.ui8.net/uploads/frame-7_1661537776017.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

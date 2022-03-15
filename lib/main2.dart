import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.orange,
        primaryColor: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('HomeScreen Screen ');
    return ChangeNotifierProvider(
        create: (context) => Appdata(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(Provider.of<Appdata>(context, listen: true).name),
              elevation: 0,
            ),
            body: const Screen2(),
          );
        });
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('building Screen 2');
    return const Screen3();
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('building Screen 3');
    return const Screen4();
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('building Screen 4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Appdata>(
            builder: (context, value, child) {
              return Text(value.name);
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<Appdata>(context, listen: false)
                  .changedata('Ololade');
            },
            child: const Text('Change Data'),
          ),
        ],
      ),
    );
  }
}

class Appdata with ChangeNotifier {
  String _name = 'Adedokun rokeeb';
  void changedata(String data) {
    _name = data;
    notifyListeners();
  }

  String get name => _name;
}

import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = 'Adewunmi ROkeeb';
  void changevalue(String datachanged) {
    setState(() {
      data = datachanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('building home page');
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
        elevation: 0,
      ),
      body: Screen2(
        data: data,
        changedata: changevalue,
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({required this.data, required this.changedata, Key? key})
      : super(key: key);

  final String data;
  final Function(String) changedata;

  @override
  Widget build(BuildContext context) {
    debugPrint('building Screen 2');
    return Screen3(
      data: data,
      changedata: changedata,
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({required this.data, required this.changedata, Key? key})
      : super(key: key);
  final String data;
  final Function(String) changedata;
  @override
  Widget build(BuildContext context) {
    debugPrint('building Screen 3');
    return Screen4(
      data: data,
      changedata: changedata,
    );
  }
}

class Screen4 extends StatefulWidget {
  const Screen4({required this.data, required this.changedata, Key? key})
      : super(key: key);
  final String data;
  final Function(String) changedata;
  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    debugPrint('building Screen 4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.data),
          ElevatedButton(
            onPressed: () {
              widget.changedata('Rokoba');
            },
            child: const Text('Change Data'),
          ),
        ],
      ),
    );
  }
}

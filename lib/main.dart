import 'package:flutter/material.dart';
import 'package:number_fact/api.dart';

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
      home: const ScreenHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

final _inputNumberController = TextEditingController();

var result = 'Enter number for get result';

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _inputNumberController,
                decoration: InputDecoration(
                    hintText: 'Enter number', border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final _number = _inputNumberController.text;
                  getNumberFact(number: _number);
                  setState(() {
                    result = _number;
                  });
                },
                child: const Text('Get fact')),
            Text(result)
          ],
        ),
      ),
    );
  }
}

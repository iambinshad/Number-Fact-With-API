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

var _resultText = 'Type number and get result';

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Number Fact'),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              child: Image.asset(
            'asset/numberbg.avif',
            height: double.infinity,
            width: double.infinity,
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _inputNumberController,
                  decoration: InputDecoration(
                      hintText: 'Enter number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () async {
                    final _number = _inputNumberController.text;
                    final _result = await getNumberFact(number: _number);
                    getNumberFact(number: _number);
                    setState(() {
                      _resultText = _result.text ?? 'No trivia text found ';
                    });
                  },
                  child: const Text('Get fact')),
              Center(child: (Text("""$_resultText""")))
            ],
          ),
        ],
      )),
    );
  }
}

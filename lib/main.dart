import 'package:flutter/material.dart';
import 'package:websocket_example/dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final TextEditingController _controllerFrom = TextEditingController();
  final TextEditingController _controllerTo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            child: TextFormField(
              controller: _controllerFrom,
              decoration: const InputDecoration(labelText: 'User name'),
            ),
          ),
          Form(
            child: TextFormField(
              controller: _controllerTo,
              decoration: const InputDecoration(labelText: 'Sender user'),
              onChanged: (asd) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => DialogPage(
                    title: _controllerTo.text,
                    from: _controllerFrom.text,
                    to: _controllerTo.text,
                  ),
                ),
              );
            },
            child: Text(_controllerTo.value.text),
          ),
        ],
      ),
    );
  }
}

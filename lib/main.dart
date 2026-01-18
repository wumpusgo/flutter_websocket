import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:websocket_example/bloc/user_bloc.dart';
import 'package:websocket_example/chat_list.dart';
import 'package:websocket_example/dialog.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(), child: ChatList()),
      ],
      // child: MaterialApp(home: MyHomePage(title: 'titulo')),
      child: MaterialApp(home: ChatList()),
    );
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
  List<String> clients = List.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      // bottomNavigationBar: FilledButton(
      //   onPressed: () async {
      //     var s = await http.get(Uri.parse('http://10.0.2.2:8080/clients'));
      //     clients = json.decode(s.body);
      //     setState(() {});
      //   },
      //   child: Text('refresh clients list'),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (clients.isNotEmpty)
          //   Expanded(
          //     child: ListView.builder(
          //       itemCount: clients.length,
          //       itemBuilder: (context, index) {
          //         return ListTile(title: Text('1'));
          //       },
          //     ),
          //   ),
          //
          // const SizedBox(height: 24),
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

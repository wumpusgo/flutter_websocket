import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websocket_example/bloc/user_bloc.dart';
import 'package:websocket_example/bloc/user_event.dart';
import 'package:websocket_example/bloc/user_state.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (contex, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.get_app, semanticLabel: 'refrescar'),
                onPressed: () {
                  userBloc.add(LoadUsers());
                },
              ),
            ],
            // TRY THIS: Try changing the color here to a specific color (to
            // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
            // change color while the other colors stay the same.
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('Lista de usuarios'),
          ),
          body: ListView.builder(
            itemCount: state.user.length, // Number of items in your data source
            itemBuilder: (BuildContext context, int index) {
              // Access data for the current item
              final item = state.user[index];

              // Return a Material widget or a widget wrapped in Material
              return Material(
                // Wrap ListTile in Material to enable animations for colors
                child: ListTile(
                  title: Text(item),
                  // subtitle: Text(item.email),
                  trailing: IconButton.outlined(
                    onPressed: () => {},
                    icon: Icon(Icons.star, color: Colors.amber),
                  ),
                  // subtitle: Text(item.id.toString()),
                  onTap: () {
                    // Handle tap event for the item
                  },
                ),
              );
            },
          ),
          // Text(
          //   state.user.isEmpty ? 'll' : state.user.first.id.toString(),
          // ),
          // This trailing comma makes auto-formatting nicer for build methods.
        );

        // return Scaffold(
        //   appBar: AppBar(title: Text('juas')),
        //   body: Column(
        //     children: [
        //       FloatingActionButton(
        //         child: Text('opcion A'),
        //         onPressed: () => testBloc.add(IncrementTest()),
        //       ),
        //       FloatingActionButton(
        //         child: Text('opcion B'),
        //         onPressed: () => testBloc.add(DecrementTest()),
        //       ),
        //
        //       if (state is TestInitial) Text('uploaded'),
        //
        //       if (state is TestUpdated) Text('uploaded'),
        //       if (state is TestUpgraded) Text('upgraded'),
        //       // else {
        //       //   Text('nadaaaa');
        //       // }
        //     ],
        //   ),
        // );
      },
    );
  }
}

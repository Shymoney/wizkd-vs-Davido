// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';
import 'package:wizkid_vs_davido/screens/home.dart';
import 'routes.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Landing(),
      routes: Router(context).routes()
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class Landing extends StatelessWidget {
 Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
      appBar: AppBar(
        title: Text('Wizkid vs Davido'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.multiline_chart),
            onPressed: () {
              // Implement navigation to shopping cart page here...
              print('Wizkid VS Davido');
            },
          ),
        ],


      ),
    );
  }
}



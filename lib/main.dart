import 'package:flutter/material.dart';
import 'session.dart';

void main() => runApp(Randomizer());

class Randomizer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CLASS 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Session _session = Session(['Christian', 'Ganjina', 'Uttam']);
  String currentPickedStudent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('CLASS 1')
            ),
            ListTile(
              title: Text('EDIT CLASS'),
              onTap: () => print('edit class!')
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentPickedStudent
            ),
            RaisedButton(
              onPressed: () {
                setState(() => currentPickedStudent = _session.pickRandomStudent());
              },
              child: Text('START'),
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

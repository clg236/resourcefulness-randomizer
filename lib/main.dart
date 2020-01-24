import 'package:flutter/material.dart';
import 'session.dart';

void main() => runApp(Randomizer());

// void _showModal() {
//     Future<void> future = showModalBottomSheet<void>(
//       context:,
//       builder: (BuildContext context) {
//         return Container(height: 260.0, child: Text('I am text'));
//       },
//     );
//     future.then((void value) => _closeModal(value));
// }
// void _closeModal(void value) {
//     print('modal closed');
// }

class Randomizer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Randomizer'),
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
  Session _session = Session(['Christian', 'Ganjina', 'Uttam', 'Peter']);
  String currentPickedStudent = '';
  String randomizerType = 'Wheel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.people),
            tooltip: 'Show Snackbar',
            onPressed: () {
              _onButtonPressed(context, _session);
              //Do something
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text('CLASS 1')),
            ListTile(
                title: Text('EDIT CLASS'), onTap: () => print('edit class!'))
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Select a randomizer'),
                DropdownButton<String>(
                  value: randomizerType,
                        onChanged: (String newValue) {
        setState(() {
          randomizerType = newValue;
        });
      },
      items: <String>['Wheel', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
                )
              ],
            ),
            Text(currentPickedStudent),
            RaisedButton(
              onPressed: () {
                setState(
                    () => currentPickedStudent = _session.pickRandomStudent());
              },
              // currentPickedStudent = _session.pickRandomStudent();
              child: Text('START'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void _onButtonPressed(BuildContext context, Session _session) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            child: ListView.builder(
                itemCount: _session.students.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Card(
                    child: ListTile(
                      onTap: () => print("TAPPED"),
                      title: Text(_session.students[index]),
                      trailing: Icon(Icons.remove_circle_outline),
                    ),
                  );
                })
            );
      });
}

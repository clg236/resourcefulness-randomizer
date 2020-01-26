import 'package:flutter/material.dart';
import 'session.dart';

void main() => runApp(Randomizer());

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
              _showManageClasses(context, _session);
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
              child: Text('START'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Animation for name in manage classes to disappear
Widget _disappearItem(String item, Animation animation) {
  return SizeTransition(
    sizeFactor: animation,
    child: Card(
      child: ListTile(
          onTap: () => print("TAPPED"),
          title: Text(item),
          trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              tooltip: 'Remove Name',
              onPressed: () {})),
    ),
  );
}

void _showManageClasses(BuildContext context, Session _session) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Manage Classes',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ])),
              AnimatedList(
                  shrinkWrap: true,
                  initialItemCount: _session.students.length,
                  itemBuilder:
                      (BuildContext ctxt, int index, Animation animation) {
                    return Card(
                      child: ListTile(
                        onTap: () => print("TAPPED"),
                        title: Text(_session.students[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          tooltip: 'Remove Name',
                          onPressed: () {
                            String _removedStudent = _session.students[index];
                            _session.removeStudent(_removedStudent);
                            AnimatedList.of(ctxt).removeItem(
                                index,
                                (context, animation) =>
                                    _disappearItem(_removedStudent, animation));
                          },
                        ),
                      ),
                    );
                  })
            ]));
      });
}

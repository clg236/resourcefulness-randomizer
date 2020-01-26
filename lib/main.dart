import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/add_student.dart';
import 'package:randomizer/list_students.dart';
import 'session.dart';

void main() => runApp(Randomizer());

class Randomizer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Session(),
          )
        ],
        child: MaterialApp(
          title: 'Randomizer',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
            '/add_student': (context) => AddStudentScreen(),
            '/list_students': (context) => ListStudentsScreen(),
          },
        ));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Randomizer"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.people),
              onPressed: () {
                Navigator.pushNamed(buildContext, "/list_students");
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Text('CLASS 1')),
              ListTile(title: Text('EDIT CLASS'), onTap: () => print('edit class!'))
            ],
          ),
        ),
        body: Consumer<Session>(builder: (consumerContext, session, child) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Select a randomizer'),
                  DropdownButton<String>(
                    value: 'Wheel',
                    items: <String>['Wheel', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
              Text(session.pickedStudent.isEmpty ? 'Click "start" to pick a random student.' : session.pickedStudent),
              RaisedButton(
                onPressed: () {
                  session.pickRandomStudent();
                },
                child: Text('START'),
              )
            ],
          ));
        }));
  }
}

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
            // These are now bottom module sheets
            // '/add_student': (context) => AddStudentScreen(),
            // '/list_students': (context) => ListStudentsScreen(),
          },
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String selected = 'Class 1';

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Randomizer"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.people),
              onPressed: () {
                // Navigator.pushNamed(buildContext, "/list_students");
                ListStudentsScreen().build(context);
              },
            ),
          ],
        ),
        body: Consumer<Session>(builder: (consumerContext, session, child) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Please select a class'),
                  DropdownButton<String>(
                    value: selected,
                    items: <String>['Class 1', 'Class 2', 'Class 3 ', 'Class 4'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      print(value);
                      setState(() => selected = value );
                    },
                  ),
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

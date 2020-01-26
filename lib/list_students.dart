import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/session.dart';

class ListStudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Students"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add a student',
              onPressed: () {
                Navigator.pushNamed(context, "/add_student");
              },
            ),
          ],
        ),
        body: Consumer<Session>(builder: (context, session, child) {
          return Container(
            child: session.students.isEmpty ? Text("There is no one here!") : ListView.builder(
                itemCount: session.students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(session.students[index]),
                    trailing: Icon(Icons.remove_circle_outline),
                    onTap: () {
                      session.removeStudent(session.students[index]);
                    },
                  );
                },

            ),
          );
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/add_student.dart';
import 'package:randomizer/session.dart';

class ListStudentsScreen{
  // @override
  void build(BuildContext context) {
    print("Yes");
    
    showModalBottomSheet(
        context: context,
        builder: (context) {
          // return Consumer<Session>(builder: (context, session, child) {
          return Container(
            height: 400,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: <Widget>[
                        Text('Students',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                          tooltip: 'Add a student',
                          onPressed: () {
                            AddStudentScreen().build(context);
                            // Navigator.pushNamed(context, "/");
                            // Navigator.pushNamed(context, "/add_student");
                            
                          },
                        ),
                      ],
                    )),
                   
                Consumer<Session>(builder: (context, session, child) {
                  return Container(
                    child: session.students.isEmpty? Text("There is no one here!")
                        : ListView.builder(
                          shrinkWrap: true,
                            itemCount: session.students.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(session.students[index]),
                                trailing: Icon(Icons.remove_circle_outline),
                                onTap: () {
                                  session
                                      .removeStudent(session.students[index]);
                                },
                              );
                            },
                          ),
                  );
                })
              ],
              //           return Scaffold(
              // appBar: AppBar(
              //   title: Text("Students"),
              //   actions: <Widget>[
              //     IconButton(
              //       icon: const Icon(Icons.add),
              //       tooltip: 'Add a student',
              //       onPressed: () {
              //         Navigator.pushNamed(context, "/add_student");
              //       },
              //     ),
              //   ],
              // ),
              // body: Consumer<Session>(builder: (context, session, child) {
              //   return Container(
              //     child: session.students.isEmpty ? Text("There is no one here!") : ListView.builder(
              //         itemCount: session.students.length,
              //         itemBuilder: (context, index) {
              //           return ListTile(
              //             title: Text(session.students[index]),
              //             trailing: Icon(Icons.remove_circle_outline),
              //             onTap: () {
              //               session.removeStudent(session.students[index]);
              //             },
              //           );
              //         },

              //     ),
              //   );
              // }));
            ),
          );
        });
  }
}

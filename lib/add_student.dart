import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/session.dart';

class AddStudentScreen{
  final _textEditingController = TextEditingController();

  // @override
  void build(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Consumer<Session>(builder: (context, session, child) {
          return Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Add Student',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    )),
                    TextField(
                      controller: _textEditingController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_textEditingController.text.isNotEmpty) {
                            session.addStudent(_textEditingController.text);
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'),
                      ),
                    )
              ],
            ),
          );
          });
          // return Scaffold(
          //     appBar: AppBar(
          //       title: Text("Add a student"),
          //     ),
          //     body: Container(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: <Widget>[
          //           TextField(
          //             controller: _textEditingController,
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 16.0),
          //             child: RaisedButton(
          //               onPressed: () {
          //                 if (_textEditingController.text.isNotEmpty) {
          //                   // session.addStudent(_textEditingController.text);
          //                 }
          //                 Navigator.of(context).pop();
          //               },
          //               child: Text('Add'),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ));
          // });
        });
  }
}

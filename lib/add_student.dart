import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomizer/session.dart';

class AddStudentScreen extends StatelessWidget {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Session>(builder: (context, session, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Add a student"),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                ),
              ],
            ),
          ));
    });
  }
}

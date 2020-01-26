import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';

class Session extends ChangeNotifier {
  List<String> _students;
  String _sessionName;
  String _pickedStudent;

  Session([List<String> students]) {
    this._students = students != null ? students : [];
    this._sessionName = '';
    this._pickedStudent = '';
  }

  UnmodifiableListView<String> get students {
    return UnmodifiableListView(this._students);
  }

  String get sessionName {
    return this._sessionName;
  }

  String get pickedStudent {
    return this._pickedStudent;
  }

  addStudent(String name) {
    if (this._students.contains(name)) {
      return;
    }

    this._students.add(name);
    this.notifyListeners();
  }

  removeStudent(String name) {
    this._students.remove(name);
    if (this._pickedStudent == name) {
      this._pickedStudent = '';
    }

    this.notifyListeners();
  }

  modifyStudent(String previousName, String newName) {
    // modify?
    return print('modify student');
  }

  pickRandomStudent() {
    if (this._students.length == 0) {
      return;
    }

    //generate a random number between number of students
    int randomNumber = Random().nextInt(this.students.length);
    this._pickedStudent = this._students[randomNumber];
    this.notifyListeners();
  }
}

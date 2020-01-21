import 'dart:math';

class Session {

  Session(List<String> students) {
    this.students = students;
    sessionName = '';
  }

  List<String> students;
  String sessionName;

  addStudent(String name) {
    return print('adding student');
  }

  removeStudent(String name) {
    return print('removing student');
  }

  modifyStudent(String previousName, String newName) {
    return print('modify student');
  }

  pickRandomStudent() {
    //generate a random number between number of students
    int randomNumber = Random().nextInt(this.students.length);
    return this.students[randomNumber];
    
    
  }

}
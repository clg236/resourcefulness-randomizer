import 'dart:math';

class Session {

  Session(List<String> students) {
    this.students = students;
    sessionName = '';
  }

  List<String> students;
  String sessionName;

  
  showStudent(){
    // this.students.forEach(student) => print(student);
    return print(this.students);
  }

  addStudent(String name) {
    this.students.add(name);
    return print('adding student');
  }

  removeStudent(String name) {
    this.students.remove(name);
    
    //this.students.remove(name)
    return print('removing student');
  }

  modifyStudent(String previousName, String newName) {
    // modify?
    return print('modify student');
  }


  pickRandomStudent() {
    //generate a random number between number of students
    int randomNumber = Random().nextInt(this.students.length);
    print(this.students[randomNumber]);
    return this.students[randomNumber];
    
    
  }

}
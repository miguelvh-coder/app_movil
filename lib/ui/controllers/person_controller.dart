import 'package:get/get.dart';

class PersonController extends GetxController {
  RxInt id = 0.obs;
  RxInt difficulta = 1.obs;
  RxInt difficultb = 1.obs;
  RxString email = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString birthday = "".obs;
  RxString course = "".obs;
  RxString password = "".obs;
  RxString school = "".obs;

  setValues(Map<String, dynamic> data) {
    int id = data['id'];
    String diffa = data['diffa'].toString();
    String diffb = data['diffb'].toString();
    String email = data['email'].toString();
    String course = data['course'].toString();
    String birthday = data['birthday'].toString();
    String lastname = data['lastname'].toString();
    String password = data['password'].toString();
    String firstname = data['firstname'].toString();
    String school = data['school'].toString();
    this.id.value = id;
    difficulta.value = int.parse(diffa);
    difficultb.value = int.parse(diffb);
    this.email.value = email;
    this.course.value = course;
    this.birthday.value = birthday;
    lastName.value = lastname;
    this.password.value = password;
    firstName.value = firstname;
    this.school.value = school;
  }

  updateDifficult(int a, int b) {
    difficulta.value = a;
    difficulta.value = b;
  }
}
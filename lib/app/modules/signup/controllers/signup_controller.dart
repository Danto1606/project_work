import 'package:project_work/index.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> form = GlobalKey();
  String? email;
  String? name;
  String? password;
  String? address;
  bool isLoading = false;
  final repo = Get.find<SessionService>();

  @override
  void onReady() {}

  @override
  void onClose() {}

  //validators
  String? validName(String? value) {
    if (value == null) {
      return "enter valid name";
    } else if (!GetUtils.isAlphabetOnly(value) && value.length < 3) {
      return "enter valid name";
    } else {
      return null;
    }
  }

  String? validEmail(String? value) {
    if (!GetUtils.isEmail(value ?? "")) {
      return "enter valid email";
    } else {
      return null;
    }
  }

  String? validPassword(String? value) {
    if (value == null) {
      return "password should be atleast 8 characters";
    } else if (value.length < 8) {
      return "password should be atleast 8 characters";
    } else {
      return null;
    }
  }

  String? confirmPassword(String? value) {
    if (value == "" || value != password) {
      return "confirm password and password must be same";
    } else {
      return null;
    }
  }

  //onSave methods
  void saveEmail(String? email) => this.email = email;
  void saveName(String? name) => this.name = name;
  void savePassword(String? password) => this.password = password;
  void saveAddress(String? address) => this.address = address;

  //sign up
  void save() async {
    if (isLoading) return;
    form.currentState?.save();
    if (form.currentState?.validate() == true) {
      isLoading = true;
      update();
      try {
        await repo.signup({
          'name': name,
          'email': email,
          'address': address,
          'password': password,
        });
        Get.offAllNamed(Routes.HOME);
      } on Exception catch (e) {
        Get.snackbar('Error', e.toString());
      } catch (e) {
        Get.log(e.toString());
      }
    }
    isLoading = false;
    update();
  }

  //return to login
  void login() => Get.back();
}

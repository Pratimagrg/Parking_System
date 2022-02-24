import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/routes.dart';
import 'package:parkingsystem/utils/base_url.dart';
import 'package:parkingsystem/widgets/custom_snackbar.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String usernameError = "";
  String passwordError = "";
  String confirmPasswordError = "";
  String nameError = "";
  String contactError = "";
  String emailError = "";
  String addressError = "";

  bool isLoading = false;

  checkSignup() {
    usernameError = "";
    passwordError = "";
    confirmPasswordError = "";
    nameError = "";
    contactError = "";
    emailError = "";
    addressError = "";
    String username = usernameController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String name = nameController.text;
    String contact = contactController.text;
    String email = emailController.text;
    String address = addressController.text;

    if (username.isEmpty) {
      usernameError = "* Username required";
    }
    if (password.isEmpty) {
      passwordError = "* Password required";
    }
    if (confirmPassword.isEmpty) {
      confirmPasswordError = "* Confirm password required";
    } else if (password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password != confirmPassword) {
      confirmPasswordError = "* Password doesnot match";
    }
    if (name.isEmpty) {
      nameError = "* Full Name required";
    }
    if (contact.isEmpty) {
      contactError = "* Contact required";
    }
    if (email.isEmpty) {
      emailError = "* Email required";
    } else if (!GetUtils.isEmail(email)) {
      emailError = "* Email format invalid";
    }
    if (address.isEmpty) {
      addressError = "* Address required";
    }

    update();

    if (usernameError == "" &&
        passwordError == "" &&
        confirmPasswordError == "" &&
        nameError == "" &&
        contactError == "" &&
        emailError == "" &&
        addressError == "") {
      attemptSignup();
    }
  }

  attemptSignup() async {
    isLoading = true;
    update();
    var url = Uri.parse(baseUrl + 'signup.php');
    var response = await http.post(url, body: {
      'username': usernameController.text,
      'password': passwordController.text,
      'email': emailController.text,
      'contact': contactController.text,
      'name': nameController.text,
      'address': addressController.text,
    });
    var res = json.decode(response.body);
    if (res['success']) {
      customSnackbar('Signup success', res['message'][0], 'success');
      Get.offAllNamed(GetRoutes.login);
    } else {
      customSnackbar('Signup Failed', res['message'][0], 'error');
    }
  }
}

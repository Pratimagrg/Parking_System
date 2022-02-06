import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/controllers/auth/login_controller.dart';
import 'package:parkingsystem/routes.dart';
import 'package:parkingsystem/views/screens/home.dart';
import 'package:parkingsystem/views/screens/register.dart';
import 'package:parkingsystem/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff154C79),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: GetBuilder<LoginController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/parkinglogo.png',
                    fit: BoxFit.cover,
                    height: 230,
                    width: 180,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Username:',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: "Enter your username",
                  controller: controller.usernameController,
                  error: controller.usernameError,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Password:',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: "Enter your password",
                  controller: controller.passwordController,
                  error: controller.passwordError,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 55,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      controller.checkLogin();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white),
                      height: 45,
                      width: 90,
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account? ',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    InkWell(
                      onTap: () {
                        Get.toNamed(GetRoutes.register);
                      },
                      child: const Text('Register',
                          style: TextStyle(fontSize: 15, color: Colors.blue)),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      )),
    );
  }
}

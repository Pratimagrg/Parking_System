import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/controllers/auth/signup_controller.dart';
import 'package:parkingsystem/routes.dart';
import 'package:parkingsystem/widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff154C79),
      body: SafeArea(
        child: GetBuilder<RegisterController>(builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      child: const Text(
                        'Register New User',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    hint: "Enter your username",
                    controller: controller.usernameController,
                    error: controller.usernameError,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    hint: "Enter your password",
                    controller: controller.passwordController,
                    error: controller.passwordError,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    hint: "Confirm password",
                    controller: controller.confirmPasswordController,
                    error: controller.confirmPasswordError,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    hint: "Enter your name",
                    controller: controller.nameController,
                    error: controller.nameError,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    hint: "Enter your contact no",
                    controller: controller.contactController,
                    error: controller.contactError,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    hint: "Enter your email",
                    controller: controller.emailController,
                    error: controller.emailError,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    hint: "Enter your address",
                    controller: controller.addressController,
                    error: controller.addressError,
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        controller.checkSignup();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        height: 45,
                        width: 95,
                        child: const Center(
                          child: Text(
                            'Register',
                            style: TextStyle(fontSize: 18, color: Colors.black),
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
                      const Text('Already have an account? ',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      InkWell(
                        onTap: () {
                          Get.toNamed(GetRoutes.login);
                        },
                        child: const Text('Login',
                            style: TextStyle(fontSize: 15, color: Colors.blue)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

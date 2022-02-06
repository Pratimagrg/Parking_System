import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkingsystem/controllers/account/account_controller.dart';
import 'package:parkingsystem/views/components/custom%20_app_bar.dart';
import 'package:parkingsystem/views/components/cutom_drawer.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  final accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: GetBuilder<AccountController>(
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: 160,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child:
                          Center(child: Image.asset('assets/images/user.png')),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(controller.username,
                        style: const TextStyle(fontSize: 25)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: controller.isEditing
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.blue,
                                width: 0.5),
                          ),
                        ),
                        child: TextFormField(
                            controller: controller.name,
                            textAlign: TextAlign.center,
                            readOnly: controller.isEditing ? false : true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: controller.isEditing
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.blue,
                                width: 0.5),
                          ),
                        ),
                        child: TextFormField(
                            controller: controller.contact,
                            textAlign: TextAlign.center,
                            readOnly: controller.isEditing ? false : true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: controller.isEditing
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.blue,
                                width: 0.5),
                          ),
                        ),
                        child: TextFormField(
                            controller: controller.email,
                            textAlign: TextAlign.center,
                            readOnly: controller.isEditing ? false : true,
                            decoration: const InputDecoration(
                                border: InputBorder.none))),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: controller.isEditing
                                    ? Colors.black.withOpacity(0.5)
                                    : Colors.blue,
                                width: 0.5),
                          ),
                        ),
                        child: TextFormField(
                            controller: controller.address,
                            textAlign: TextAlign.center,
                            readOnly: controller.isEditing ? false : true,
                            decoration: const InputDecoration(
                                border: InputBorder.none))),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.checkUserUpdate();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff154C79)),
                            height: 45,
                            width: 90,
                            child: controller.isEditing
                                ? const Text(
                                    'Update',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  )
                                : const Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: controller.isEditing ? true : false,
                          child: InkWell(
                            onTap: () {
                              controller.isEditing = false;
                              controller.update();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.red),
                                height: 45,
                                width: 90,
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

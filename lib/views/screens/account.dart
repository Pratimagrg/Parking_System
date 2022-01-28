import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkingsystem/views/components/custom%20_app_bar.dart';
import 'package:parkingsystem/views/components/cutom_drawer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  File? pickedImageFile;
  final picker = ImagePicker();
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    imageUpLoad();
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 160,
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                            child: pickedImageFile == null
                                ? Image.asset('assets/images/user.png')
                                : ClipRRect(
                                    child: Image.file(
                                      pickedImageFile!,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                      ),
                      isEditing
                          ? const Positioned(
                              top: 115,
                              left: 220,
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: FaIcon(
                                    FontAwesomeIcons.camera,
                                    color: Color(0xff154C79),
                                  )))
                          : const Positioned(
                              top: 115,
                              left: 220,
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: FaIcon(
                                    FontAwesomeIcons.pencilAlt,
                                    color: Color(0xff154C79),
                                  )))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Username', style: TextStyle(fontSize: 25)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: isEditing
                                ? Colors.black.withOpacity(0.5)
                                : Colors.blue,
                            width: 0.5),
                      ),
                    ),
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: isEditing ? false : true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter User name"))),
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: isEditing
                                ? Colors.black.withOpacity(0.5)
                                : Colors.blue,
                            width: 0.5),
                      ),
                    ),
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: isEditing ? false : true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter Contact"))),
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: isEditing
                                ? Colors.black.withOpacity(0.5)
                                : Colors.blue,
                            width: 0.5),
                      ),
                    ),
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: isEditing ? false : true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter Email"))),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff154C79)),
                      height: 45,
                      width: 90,
                      child: Center(
                        child: isEditing
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
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  imageUpLoad() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pickedImageFile = File(pickedFile.path);
      });
    }
  }
}

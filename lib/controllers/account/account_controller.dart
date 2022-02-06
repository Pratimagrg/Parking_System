import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/models/user.dart';
import 'package:parkingsystem/utils/base_url.dart';
import 'package:parkingsystem/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:parkingsystem/widgets/custom_snackbar.dart';

class AccountController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController address = TextEditingController();
  String username = "";
  String id = "";
  bool isEditing = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserDetails();
  }

  getUserDetails() async {
    var user = await SharedPrefs().getUser();
    var decodeUser = json.decode(user);

    id = decodeUser['id'];
    username = decodeUser['username'];
    name.text = decodeUser['name'];
    email.text = decodeUser['email'];
    contact.text = decodeUser['contact'];
    address.text = decodeUser['address'];

    update();
  }

  checkUserUpdate() {
    if (isEditing) {
      updateUser();
    } else {
      isEditing = true;
      update();
    }
  }

  updateUser() async {
    var url = Uri.parse(baseUrl + 'update_user.php');
    var response = await http.post(url, body: {
      'id': id,
      'name': name.text,
      'email': email.text,
      'contact': contact.text,
      'address': address.text,
      'username': username
    });
    var res = json.decode(response.body);

    if (res['success']) {
      User user = User.fromJson(res['data'][0]);
      await SharedPrefs().storeUser(json.encode(user));
      getUserDetails();
      customSnackbar('Update success', res['message'], 'success');
      isEditing = false;
    } else {
      getUserDetails();
      customSnackbar('Failed to Update', res['message'], 'error');
    }

    update();
  }
}

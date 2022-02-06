import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/routes.dart';
import 'package:parkingsystem/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:parkingsystem/utils/shared_prefs.dart';
import 'package:parkingsystem/widgets/custom_snackbar.dart';

class EntryContoller extends GetxController {
  var categories = [];
  int selectedCategory = -1;

  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController vehicleBrandController = TextEditingController();

  String vehicleNoError = "";
  String vehicleBrandError = "";
  String categoryError = "";

  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategory();
  }

  fetchCategory() async {
    var url = Uri.parse(baseUrl + 'categories.php');
    var response = await http.get(url);
    var res = json.decode(response.body);
    if (res['success']) {
      categories = res['message'];
    } else {
      customSnackbar('Category Fetch Failed', "Something went wrong!", 'error');
    }
    update();
  }

  categoryChange(String cat) {
    selectedCategory = int.parse(cat);
    update();
  }

  checkVehicleEntry() {
    vehicleNoError = "";
    vehicleBrandError = "";
    categoryError = "";

    String vehicleNo = vehicleNoController.text;
    String vehicleBrand = vehicleBrandController.text;
    int selectedCat = selectedCategory;

    if (vehicleNo.isEmpty) {
      vehicleNoError = '* Vehicle Number required';
    }
    if (vehicleBrand.isEmpty) {
      vehicleBrandError = '* Vehicle Number required';
    }
    if (selectedCat == -1) {
      categoryError = "Please select category";
    }

    update();

    if (vehicleNoError == "" &&
        vehicleBrandError == "" &&
        categoryError == "") {
      attemptVehicleEntry();
    }
  }

  attemptVehicleEntry() async {
    var user = await SharedPrefs().getUser();
    var decodeUser = json.decode(user);

    isLoading = true;
    update();
    var url = Uri.parse(baseUrl + 'vehicle_entry.php');
    var response = await http.post(url, body: {
      'vehicle_number': vehicleNoController.text,
      'vehicle_brand': vehicleBrandController.text,
      'category_id': selectedCategory.toString(),
      'user_id': decodeUser['id']
    });
    var res = json.decode(response.body);
    if (res['success']) {
      customSnackbar('Entry Success', res['message'][0], 'success');
      Get.offAndToNamed(GetRoutes.home);
    } else {
      customSnackbar('Login Failed', res['message'][0], 'error');
    }
  }
}

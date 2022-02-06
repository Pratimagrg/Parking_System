import 'dart:convert';

import 'package:get/get.dart';
import 'package:parkingsystem/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:parkingsystem/utils/shared_prefs.dart';
import 'package:parkingsystem/widgets/custom_snackbar.dart';

class ExitController extends GetxController {
  var vehicles = [];
  Map<String, dynamic> vehicleOut = {
    "vehicle_number": "",
    "brand": "",
    "in_time": "",
    "out_time": "",
    "time_parked": "",
    "cost_per_hour": "",
    "cost": ""
  };
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMyVehicles();
  }

  fetchMyVehicles() async {
    var user = await SharedPrefs().getUser();
    var decodeUser = json.decode(user);
    var url = Uri.parse(baseUrl + 'my_vehicles.php');
    var response = await http.post(url, body: {
      'user_id': decodeUser['id'],
    });
    var res = json.decode(response.body);
    if (res['success']) {
      vehicles = res['data'];
    } else {
      customSnackbar('Failed to Fetch', "Something went wrong!", 'error');
    }
    update();
  }

  calculateVehicleOut(id) async {
    isLoading = true;
    update();
    var url = Uri.parse(baseUrl + 'vehicle_out.php');
    var response = await http.post(url, body: {
      'vehicle_number': id,
    });
    var res = json.decode(response.body);
    if (res['success']) {
      vehicleOut = res['bill_details'];
    } else {
      customSnackbar('Failed to Fetch', "Something went wrong!", 'error');
    }
    isLoading = false;
    update();
  }
}

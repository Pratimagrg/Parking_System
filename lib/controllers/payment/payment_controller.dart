import 'dart:convert';

import 'package:get/get.dart';
import 'package:parkingsystem/routes.dart';
import 'package:parkingsystem/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:parkingsystem/widgets/custom_snackbar.dart';

class PaymentController extends GetxController {
  makePayment(token, vehicleNumber) async {
    var url = Uri.parse(baseUrl + 'payment.php');
    var response = await http.post(url, body: {
      'vehicle_number': vehicleNumber,
      'payment_token': token,
    });
    var res = jsonDecode(response.body);
    if (res['success']) {
      customSnackbar('Payment Success', 'Payment completed', 'success');
      Get.offAllNamed(GetRoutes.home);
    } else {
      customSnackbar('Payment failed', 'Something went wrong', 'error');
    }
  }
}

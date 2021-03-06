import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/controllers/home/exit_controller.dart';
import 'package:parkingsystem/views/components/custom%20_app_bar.dart';
import 'package:parkingsystem/views/components/cutom_drawer.dart';
import 'package:parkingsystem/views/screens/payment/payment_selector_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: GetBuilder<ExitController>(builder: (controller) {
          return SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      controller.isLoading.value
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 25),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x60000000),
                                    offset: Offset(0, 6),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: const Text(
                                'Loading',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff154C79)),
                              ),
                            )
                          : Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x60000000),
                                    offset: Offset(0, 6),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Vehicle No:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Vehicle Brand:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Entry time:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Exit time:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Total time:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Total Cost:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .vehicleOut['vehicle_number']!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller.vehicleOut['brand']!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller.vehicleOut['in_time']!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller.vehicleOut['out_time']!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller.vehicleOut['time_parked']!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff154C79)),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Rs. ' +
                                            controller.vehicleOut['cost']!
                                                .toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff157915),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.to(PaymentSelector(
                                vehicleOut: controller.vehicleOut));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff154C79)),
                            height: 45,
                            width: 110,
                            child: const Center(
                              child: Text(
                                'Proceed',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )));
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/controllers/home/exit_controller.dart';
import 'package:parkingsystem/views/components/custom%20_app_bar.dart';
import 'package:parkingsystem/views/components/cutom_drawer.dart';
import 'package:parkingsystem/views/screens/detail.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);

  final exitController = Get.put(ExitController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: GetBuilder<ExitController>(builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'List of the parked vehicles.',
                      style: TextStyle(fontSize: 20, color: Color(0xff154C79)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: controller.vehicles
                          .map(
                            (e) => VehicleList(vehicle: e),
                          )
                          .toList(),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

class VehicleList extends StatelessWidget {
  const VehicleList({Key? key, required this.vehicle}) : super(key: key);

  final dynamic vehicle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 30),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vehicle['number'],
                style: const TextStyle(fontSize: 22, color: Color(0xff154C79)),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                vehicle['in_time'],
                style: const TextStyle(fontSize: 15, color: Color(0xff154C79)),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vehicle['brand'],
                style: const TextStyle(fontSize: 17, color: Color(0xff154C79)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

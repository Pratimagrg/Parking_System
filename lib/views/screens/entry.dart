import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/controllers/home/entry_controller.dart';
import 'package:parkingsystem/views/components/custom%20_app_bar.dart';
import 'package:parkingsystem/views/components/cutom_drawer.dart';
import 'package:parkingsystem/widgets/custom_textfield.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: GetBuilder<EntryContoller>(builder: (controller) {
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
                      'Please select your vehicle type.',
                      style: TextStyle(fontSize: 20, color: Color(0xff154C79)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.categories
                          .map((e) => GestureDetector(
                                onTap: () {
                                  controller.categoryChange(e['id']);
                                },
                                child: VehicleType(
                                    imageName: e['id'] == "1"
                                        ? 'bike'
                                        : e['id'] == "2"
                                            ? 'car'
                                            : 'bus',
                                    slots: e['slots'],
                                    cost: e['cost_per_hour'],
                                    isSelected: controller.selectedCategory
                                            .toString() ==
                                        e['id']),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Visibility(
                        visible: controller.categoryError == "" ? false : true,
                        child: Text(
                          controller.categoryError,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16),
                          textAlign: TextAlign.right,
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Vehicle No.',
                      style: TextStyle(fontSize: 20, color: Color(0xff154C79)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hint: "Enter your vehicle number",
                      controller: controller.vehicleNoController,
                      error: controller.vehicleNoError,
                      errorColor: Colors.red,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Vehicle Brand',
                      style: TextStyle(fontSize: 20, color: Color(0xff154C79)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      hint: "Enter your vehicle brand",
                      controller: controller.vehicleBrandController,
                      error: controller.vehicleBrandError,
                      errorColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          controller.checkVehicleEntry();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff154C79)),
                          height: 45,
                          width: 100,
                          child: const Center(
                            child: Text(
                              'Proceed',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

class VehicleType extends StatelessWidget {
  const VehicleType({
    Key? key,
    required this.imageName,
    required this.slots,
    required this.cost,
    required this.isSelected,
  }) : super(key: key);

  final String imageName;
  final String slots;
  final String cost;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
            width: 2, color: isSelected ? Colors.blue : Colors.white),
        boxShadow: const [
          BoxShadow(
            color: Color(0x60000000),
            offset: Offset(0, 6),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/$imageName.png',
            height: 80,
            fit: BoxFit.contain,
          ),
          Text('Total Slots: $slots',
              style: const TextStyle(fontSize: 15, color: Color(0xff154C79))),
          Text('Rs. $slots / hour',
              style: const TextStyle(fontSize: 14, color: Color(0xff154C79)))
        ],
      ),
    );
  }
}

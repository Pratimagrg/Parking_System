import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/views/components/custom%20_app_bar.dart';
import 'package:parkingsystem/views/components/cutom_drawer.dart';
import 'package:parkingsystem/views/screens/detail.dart';

class EntryListScreen extends StatelessWidget {
  const EntryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                        children: const [
                          Text(
                            'Vehicle No',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xff154C79)),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            '2022/01/25',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff154C79)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Vehicle Brand',
                            style: TextStyle(
                                fontSize: 17, color: Color(0xff154C79)),
                          ),
                          Text(
                            '1:30 AM',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff154C79)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                        children: const [
                          Text(
                            'Vehicle No',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xff154C79)),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            '2022/01/25',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff154C79)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Vehicle Brand',
                            style: TextStyle(
                                fontSize: 17, color: Color(0xff154C79)),
                          ),
                          Text(
                            '1:30 AM',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff154C79)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(const DetailScreen());
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff154C79)),
                      height: 45,
                      width: 90,
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 17, color: Colors.white),
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
}

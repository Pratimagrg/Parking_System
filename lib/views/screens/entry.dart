import 'package:flutter/material.dart';
import 'package:parkingsystem/views/components/custom%20_app_bar.dart';
import 'package:parkingsystem/views/components/cutom_drawer.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

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
                  'Please select your vehicle type.',
                  style: TextStyle(fontSize: 20, color: Color(0xff154C79)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    VehicleType(imageName: 'bike'),
                    VehicleType(imageName: 'car'),
                    VehicleType(imageName: 'bus')
                  ],
                ),
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
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter your vehicle no.',
                  ),
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
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter your vehicle brand',
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff154C79)),
                      height: 45,
                      width: 100,
                      child: const Center(
                        child: Text(
                          'Proceed',
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

class VehicleType extends StatelessWidget {
  const VehicleType({Key? key, required this.imageName}) : super(key: key);

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
          const Text('5',
              style: TextStyle(fontSize: 15, color: Color(0xff154C79))),
          const Text('Available in 50',
              style: TextStyle(fontSize: 13, color: Color(0xff154C79)))
        ],
      ),
    );
  }
}

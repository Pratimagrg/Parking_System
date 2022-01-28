import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/views/components/custom%20_app_bar.dart';
import 'package:parkingsystem/views/components/cutom_drawer.dart';
import 'package:parkingsystem/views/screens/entry.dart';
import 'package:parkingsystem/views/screens/entrylist.dart';
import 'package:parkingsystem/widgets/inout_btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InOutClass(
              imgName: 'in',
              onPress: () {
                Get.to(const EntryScreen());
              },
            ),
            const SizedBox(
              height: 80,
            ),
            InOutClass(
              imgName: 'out',
              onPress: () {
                Get.to(const EntryListScreen());
              },
            ),
          ],
        ),
      )),
    );
  }
}

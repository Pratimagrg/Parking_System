import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingsystem/views/screens/account.dart';
import 'package:parkingsystem/views/screens/login.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        backgroundColor: const Color(0xff154C79),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Color(0xff154C79),
              ),
              child: Image.asset(
                'assets/images/parkinglogo.png',
                height: 80,
                width: 80,
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('My Account',
                  style: TextStyle(color: Colors.white, fontSize: 19)),
              onTap: () {
                Get.to(const AccountScreen());
              },
            ),
            ListTile(
              title: const Text('Logout',
                  style: TextStyle(color: Colors.white, fontSize: 19)),
              onTap: () {
                Get.to(const LoginScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:notepad/constant/image.dart';
import 'package:notepad/view_screen/Add_Note_Screen/add_screen.dart';
import 'package:notepad/view_screen/profile_screen/profile_Screen.dart';

import '../../constant/text.dart';

// ignore: camel_case_types
class Drawer_Screen extends StatefulWidget {
  const Drawer_Screen({super.key});

  @override
  State<Drawer_Screen> createState() => _Drawer_ScreenState();
}

class _Drawer_ScreenState extends State<Drawer_Screen> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? largewhite =
        TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? mediumwhite =
        TextFormate(colors: Colors.white).textMediumFormate(context);
    final TextStyle? smallwhite =
        TextFormate(colors: Colors.white).textSmallFormate(context);

    return Drawer(
      backgroundColor: Colors.green.shade400,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            accountName: Text(
              "",
              style: largewhite,
            ),
            accountEmail: Text(
              "Simon Mohapatra",
              style: largewhite,
            ),
            currentAccountPicture: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("asset/profile.jpg"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Add Notes',
              style: largewhite,
            ),
            onTap: () {
              Get.to<AddScreen>(const AddScreen());
            },
          ),
          ListTile(
            title: Text('Profile', style: largewhite),
            onTap: () {
              Get.to<ProfileScreen>(const ProfileScreen());
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notepad/constant/colors.dart';
import 'package:notepad/view_screen/home_screen/home_screen.dart';
import '../../constant/text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool _isImageLarge = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle? largewhite =
        TextFormate(colors: Colors.white).textLargeFormate(context);
    final TextStyle? largeblack =
        TextFormate(colors: Colors.black).textLargeFormate(context);
    final TextStyle? largeblack2 =
        TextFormate(colors: const Color.fromARGB(255, 81, 81, 81))
            .textLargeFormate(context);

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: AppColor.whiteall,
      appBar: AppBar(
        backgroundColor: AppColor.appbarcolor,
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const HomeScreen());
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Text('Profile', style: largewhite),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/splashBg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: screenHeight * 0.8,
              width: screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'asset/splashBg.jpg'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageLarge = !_isImageLarge;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isImageLarge ? 150.w : 100.w,
                  height: _isImageLarge ? 150.h : 100.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('asset/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: 80.h,
            //   left: 140.w,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('Simon\'s NotePad App', style: largewhite),
            //       Text('01571258430', style: mediumwhite),
            //       Text('Simonvmhp@gmail.com', style: mediumwhite),
            //     ],
            //   ),
            // ),
            Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Container(
                  height: screenHeight * 0.45,
                  width: screenWidth * 0.9,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColor.whiteall,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Created By Simon Mohapatra', style: largeblack),
                      const Divider(color: Colors.black12, thickness: 1),
                      Text('simonvmhp@gmail.com', style: largeblack),
                      // const Divider(color: Colors.black12, thickness: 1),
                      // Text('01571258430', style: largeblack),
                      const Divider(color: Colors.black12, thickness: 1),
                      Text(
                          'A Notepad App created using Flutter is a lightweight, user-friendly application designed to help users easily create, edit, and organize notes. The app features a clean, intuitive UI, with the ability to add titles, descriptions, and categorize notes.',
                          style: largeblack2),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

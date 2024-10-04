import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notepad/constant/colors.dart';
import 'package:notepad/constant/text.dart';
import 'package:notepad/db_service/db_herper.dart';
import 'package:notepad/view_screen/home_screen/home_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final titleEditingController = TextEditingController();
  final descriptionEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextStyle? large =
        TextFormate(colors: Colors.white).textLargeFormate(context);
    // final TextStyle? medium =
    //     TextFormate(colors: Colors.white).textMediumFormate(context);
    // final TextStyle? small =
    //     TextFormate(colors: Colors.white).textSmallFormate(context);

    return Scaffold(
      backgroundColor: AppColor.addNbodycolor,
      appBar: AppBar(
        backgroundColor: AppColor.appbarcolor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.offAll<HomeScreen>(const HomeScreen());
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 28, // Slightly larger for better visual hierarchy
          ),
        ),
        title: Text('Add', style: large?.copyWith(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Input
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "Title",
                  style: large?.copyWith(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                minLines: 1,
                maxLines: null,
                controller: titleEditingController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.shade600), // Softer border color
                    borderRadius:
                        BorderRadius.circular(12), // More rounded for better UX
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 16), // Spacious padding
                  labelText: "Enter Title",
                  labelStyle:
                      TextStyle(color: Colors.grey.shade800, fontSize: 16),
                ),
              ),

              const SizedBox(height: 24),

              // Description Input
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "Description",
                  style: large?.copyWith(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                minLines: 3,
                maxLines: null,
                controller: descriptionEditController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  labelText: "Enter Description",
                  labelStyle:
                      TextStyle(color: Colors.grey.shade800, fontSize: 16),
                ),
              ),

              const SizedBox(height: 30),

              // Save Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonColor,
                    shadowColor: Colors.greenAccent,
                    elevation: 4,
                    fixedSize: Size(306.w, 45.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () async {
                    if (titleEditingController.text.isEmpty ||
                        descriptionEditController.text.isEmpty) {
                      var snackBar = const SnackBar(
                          content: Text('All fields are required!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      await DbHelper().addnote(
                        context,
                        titleEditingController.text,
                        descriptionEditController.text,
                      );
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

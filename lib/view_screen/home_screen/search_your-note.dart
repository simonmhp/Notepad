import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/colors.dart';
import '../../constant/text.dart';

// ignore: camel_case_types
class Search_Your_Notes extends StatefulWidget {
  const Search_Your_Notes({super.key});

  @override
  State<Search_Your_Notes> createState() => _SearchYourNotesState();
}

class _SearchYourNotesState extends State<Search_Your_Notes> {
  @override
  Widget build(BuildContext context) {
    // final TextStyle? largeblack =
    //     TextFormate(colors: Colors.black).textLargeFormate(context);
    final TextStyle? mediumblack =
        TextFormate(colors: Colors.black).textMediumFormate(context);
    // final TextStyle? smallblack =
    //     TextFormate(colors: Colors.black).textSmallFormate(context);

    return Padding(
      padding: const EdgeInsets.all(15.0).r,
      child: Container(
        decoration: const BoxDecoration(),
        child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              //fillColor: Colors.black.withOpacity(0.4),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.blackall),
                borderRadius: BorderRadius.circular(10.r),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              labelText: "Search Your Notes",
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
              labelStyle: mediumblack
              // const TextStyle(
              //     color: Colors.white
              // ),
              ), // Label for the name field
        ),
      ),
    );
  }
}

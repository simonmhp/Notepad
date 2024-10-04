import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notepad/constant/colors.dart';
import 'package:get/get.dart';
import '../../constant/text.dart';
import '../../db_service/db_herper.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails(
      {super.key,
      this.title,
      this.description,
      this.backgroundcolor,
      this.id,
      this.date});
  final int? id;
  final dynamic date;
  final String? title;
  final String? description;
  final Color? backgroundcolor;

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  final titleEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  void initState() {
    setData();
    super.initState();
  }

  void setData() {
    setState(() {
      titleEditingController.text = widget.title.toString();
      descriptionEditingController.text = widget.description.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? largewhite =
        TextFormate(colors: Colors.white).textLargeFormate(context);

    return Scaffold(
      backgroundColor: AppColor.bodycolor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (kDebugMode) {
              print('success');
              print(widget.id);
            }

            if (titleEditingController.text.isEmpty ||
                descriptionEditingController.text.isEmpty) {
              var snackBar =
                  const SnackBar(content: Text('All fields are required!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              await DbHelper().noteupdate(
                  widget.id,
                  {
                    'title': titleEditingController.text,
                    'description': descriptionEditingController.text,
                  },
                  context);
            }
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
        backgroundColor: AppColor.appbarcolor,
        title: Text(
          'Note Details',
          style: largewhite?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Date: ${widget.date}',
                  style: largewhite?.copyWith(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.backgroundcolor?.withOpacity(0.9),
                border: Border.all(color: Colors.white, width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextFormField(
                    minLines: 1,
                    maxLines: null,
                    controller: titleEditingController,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter note title",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Description',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextFormField(
                    minLines: 1,
                    maxLines: null,
                    controller: descriptionEditingController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter note description",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (titleEditingController.text.isEmpty ||
              descriptionEditingController.text.isEmpty) {
            var snackBar =
                const SnackBar(content: Text('All fields are required!'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            await DbHelper().noteupdate(
                widget.id,
                {
                  'title': titleEditingController.text,
                  'description': descriptionEditingController.text,
                },
                context);
            Get.back();
          }
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.save, color: Colors.white),
        label: const Text(
          'Save',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

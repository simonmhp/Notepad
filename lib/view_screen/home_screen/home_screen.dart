import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notepad/constant/colors.dart';
// import 'package:poly_notepad_app/constant/image.dart';
import 'package:notepad/db_service/db_herper.dart';
import 'package:notepad/view_screen/Add_Note_Screen/add_screen.dart';
import 'package:notepad/view_screen/home_screen/drawer.dart';
import 'package:notepad/view_screen/home_screen/search_your-note.dart';
import 'package:notepad/view_screen/note_details/note_details.dart';
// import 'package:poly_notepad_app/view_screen/profile_screen/profile_Screen.dart';
import '../../constant/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List items = [];

  @override
  void initState() {
    readItemsDatabase();
    super.initState();
  }

  Future<void> readItemsDatabase() async {
    setState(() {
      items = [];
    });

    final allNotes = await DbHelper().readItems();
    if (kDebugMode) {
      print(allNotes);
    }
    setState(() {
      items.addAll(allNotes);
    });
  }

  String? direction = 'listview';

  @override
  Widget build(BuildContext context) {
    // final TextStyle? largeblack =
    //     TextFormate(colors: Colors.black).textLargeFormate(context);
    final TextStyle? mediumblack =
        TextFormate(colors: Colors.black).textMediumFormate(context);

    // final TextStyle? largewhite =
    //     TextFormate(colors: Colors.white).textLargeFormate(context);

    final List<Color> colors = [
      const Color.fromRGBO(245, 245, 220, 1),
      const Color.fromRGBO(236, 239, 241, 1),
      const Color.fromRGBO(224, 247, 250, 1),
      const Color.fromRGBO(255, 248, 225, 1),
      const Color.fromRGBO(237, 231, 246, 1),
      const Color.fromRGBO(255, 234, 182, 1),
      const Color.fromRGBO(255, 204, 188, 1),
      const Color.fromRGBO(179, 229, 252, 1),
      const Color.fromRGBO(255, 249, 196, 1),
      const Color.fromRGBO(255, 228, 225, 1),
      const Color.fromRGBO(225, 190, 231, 1),
      const Color.fromRGBO(214, 205, 175, 1),
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 5,
          backgroundColor: AppColor.appbarcolor,
          title: Text(
            "NotePad",
            style: context.textTheme.titleLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  direction = direction == "listview" ? "gridview" : "listview";
                });
              },
              icon: Icon(
                direction == "listview" ? Icons.list : Icons.grid_view,
              ),
            ),
          ],
        ),
        drawer: const Drawer_Screen(),
        body: RefreshIndicator(
          onRefresh: () => readItemsDatabase(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Search_Your_Notes(),
                direction == 'gridview'
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final Color backgroundColor =
                                colors[index % colors.length];

                            String titleText =
                                items[index]['title'] ?? 'No Title';
                            String firstLetter =
                                titleText.isNotEmpty ? titleText[0] : '?';

                            return InkWell(
                              onTap: () {
                                Get.to<NoteDetails>(
                                  () => NoteDetails(
                                    title: items[index]['title'],
                                    description: items[index]['description'],
                                    id: items[index]['id'],
                                    date: items[index]['date'],
                                    backgroundcolor:
                                        colors[index % colors.length],
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 4.0),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              child: Center(
                                                child: Text(
                                                  firstLetter,
                                                  style: context
                                                      .textTheme.titleMedium
                                                      ?.copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              DbHelper().deleteItems(
                                                  items[index]['id'], context);
                                              readItemsDatabase();
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        titleText,
                                        style: context.textTheme.titleLarge
                                            ?.copyWith(color: Colors.black),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        items[index]['description'] ??
                                            'No Description',
                                        style: mediumblack,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final Color backgroundColor =
                              colors[index % colors.length];

                          String titleText =
                              items[index]['title'] ?? 'No Title';
                          String firstLetter =
                              titleText.isNotEmpty ? titleText[0] : '?';

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: backgroundColor,
                              elevation: 5,
                              child: InkWell(
                                onTap: () {
                                  Get.to<NoteDetails>(
                                    () => NoteDetails(
                                      title: items[index]['title'],
                                      description: items[index]['description'],
                                      id: items[index]['id'],
                                      date: items[index]['date'],
                                      backgroundcolor:
                                          colors[index % colors.length],
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    titleText,
                                    style: context.textTheme.titleLarge
                                        ?.copyWith(color: Colors.black),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    items[index]['description'] ??
                                        'No Description',
                                    style: mediumblack,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      DbHelper().deleteItems(
                                          items[index]['id'], context);
                                      readItemsDatabase();
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  leading: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 4.0),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Center(
                                        child: Text(
                                          firstLetter,
                                          style: context.textTheme.titleMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.orange.withOpacity(0.5),
          onPressed: () {
            Get.to<AddScreen>(const AddScreen());
          },
          label: Text(
            'Add',
            style: mediumblack,
          ),
          icon: const Icon(Icons.add, color: Colors.black, size: 25),
        ));
  }
}

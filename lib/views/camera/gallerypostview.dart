import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:storage_path/storage_path.dart';
import '../../mainscreen.dart';
import 'filemodel.dart';

class PostScreen extends StatefulWidget /* GetView<CameraSController>*/ {
  PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<FileModel> files = [];
  FileModel? selectedModel;
  String? image;
  BoxFit fit = BoxFit.cover;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: ([SystemUiOverlay.bottom]));
    getimagesPath();
  }

  getimagesPath() async {
    // Permission permission = Permission.storage;
    var imagepath = await StoragePath.imagesPath;
    var images = jsonDecode(imagepath) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    print("inside path");
    if (files != null && files.length > 0) {
      print("inside files");
      setState(() {
        selectedModel = files[0];
        image = files[0].files[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(top: 26.h),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                titlebar(),
                const Divider(
                  height: 0,
                ),
                pictureview(),
                const Divider(
                  height: 0,
                ),
                secondtitlebar(),
                selectedModel == null ? Container() : allimages()
              ],
            ),
          ),
        ),
      ),
    );
  }

  getitems() {
    return files
        .map((e) => DropdownMenuItem(
              child: Text(
                e.folder,
                style: const TextStyle(color: Colors.black),
              ),
              value: e,
            ))
        .toList();
  }

  @override
  void dispose() {
    print("dispose from pose screen");
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  titlebar() {
    return Container(
      padding: EdgeInsets.fromLTRB(8.w, 0.0, 8.w, 0.0),
      height: 50.h,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.clear, size: 28),
            onPressed: () {
              Get.offAll(() => const MainScreen(),
                  transition: Transition.rightToLeft);
            },
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            "New Post",
            style: TextStyle(fontSize: 24.sp),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
            size: 28,
          )
        ],
      ),
    );
  }

  pictureview() {
    return Container(
      height: MediaQuery.of(Get.context!).size.height * 0.45,
      width: MediaQuery.of(Get.context!).size.width,
      color: Colors.black,
      child: image != null
          ? Stack(
              children: [
                Container(
                  height: MediaQuery.of(Get.context!).size.height * 0.45,
                  width: MediaQuery.of(Get.context!).size.width,
                  child: Image.file(
                    File(image!),
                    fit: fit,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        fit == BoxFit.cover
                            ? setState(() {
                                fit =
                                    // BoxFit.fitWidth;
                                    BoxFit.contain;
                              })
                            : setState(() {
                                fit = BoxFit.cover;
                              });
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 20.r,
                          child: const Icon(
                            Icons.transform,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
              ],
            )
          : Container(
              color: Colors.blue,
            ),
    );
  }

  secondtitlebar() {
    return Container(
      padding: EdgeInsets.fromLTRB(0.w, 0.0, 8.w, 0.0),
      height: 50.h,
      child: Row(
        children: [
          SizedBox(
            height: 40.h,
            width: 130.w,
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                alignment: Alignment.centerLeft,
                iconEnabledColor: Colors.black,
                icon: Icon(Icons.keyboard_arrow_down),
                items: getitems(),
                onChanged: (FileModel? item) {
                  image = item!.files[0];
                  setState(() {
                    selectedModel = item;
                  });
                },
                value: selectedModel,
                isExpanded: true,
                isDense: true,
              )),
            ),
          ),
          Spacer(),
          CircleAvatar(
            radius: 12.r,
            backgroundColor: Colors.grey,
          ),
          SizedBox(width: 10.w),
          CircleAvatar(
            radius: 12.r,
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  allimages() {
    return Container(
      width: MediaQuery.of(Get.context!).size.width,
      // height: MediaQuery.of(context).size.height * 0.365,
      // color: Colors.blue,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 1.5, mainAxisSpacing: 1.5),
          itemCount: selectedModel!.files.length,
          itemBuilder: (_, i) {
            var file = selectedModel!.files[i];
            return GestureDetector(
              onTap: () {
                setState(() {
                  image = file;
                });
              },
              child: Image.file(
                File(file),
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}

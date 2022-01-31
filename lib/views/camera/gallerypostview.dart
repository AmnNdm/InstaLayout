import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storage_path/storage_path.dart';

class PostScreen extends StatefulWidget /*GetView<CameraSController>*/ {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<FileModel> files = [];
  FileModel? selectedModel;
  String? image;

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
      body: SafeArea(
        minimum: EdgeInsets.only(top: 20.h),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8.w, 0.0, 8.w, 0.0),
                height: 50.h,
                child: Row(
                  children: [
                    Icon(
                      Icons.clear,
                      size: 28,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "New Post",
                      style: TextStyle(fontSize: 24.sp),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 28,
                    )
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     DropdownButtonHideUnderline(
              //         child: DropdownButton(
              //       iconEnabledColor: Colors.black,
              //       items: getitems(),
              //       onChanged: (item) {},
              //       value: selectedModel,
              //     ))
              //   ],
              // ),
              Divider(
                height: 0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                child: image != null
                    ? Image.file(
                        File(image!),
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.blue,
                      ),
              ),
              const Divider(),
            ],
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
                style: TextStyle(color: Colors.black),
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
}

//   late List<FileModel> files;
//   late FileModel selectedModel;
//   late String image;
//   @override
//   void initState() {
//     super.initState();
//     getImagesPath();
//   }

//   getImagesPath() async {
//     var imagePath = await StoragePath.imagesPath;
//     var images = jsonDecode(imagePath) as List;
//     files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
//     if (files != null && files.length > 0)
//       setState(() {
//         selectedModel = files[0];
//         image = files[0].files[0];
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Icon(Icons.clear),
//                     SizedBox(width: 10),
//                     DropdownButtonHideUnderline(
//                         child: DropdownButton<FileModel>(
//                       items: getItems(),
//                       onChanged: (FileModel? d) {
//                         assert(d!.files.length > 0);
//                         image = d!.files[0];
//                         setState(() {
//                           selectedModel = d;
//                         });
//                       },
//                       value: selectedModel,
//                     ))
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Next',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 )
//               ],
//             ),
//             Divider(),
//             Container(
//                 height: MediaQuery.of(context).size.height * 0.45,
//                 child: image != null
//                     ? Image.file(File(image),
//                         height: MediaQuery.of(context).size.height * 0.45,
//                         width: MediaQuery.of(context).size.width)
//                     : Container()),
//             Divider(),
//             selectedModel == null && selectedModel.files.length < 1
//                 ? Container()
//                 : Container(
//                     height: MediaQuery.of(context).size.height * 0.38,
//                     child: GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 4,
//                             crossAxisSpacing: 4,
//                             mainAxisSpacing: 4),
//                         itemBuilder: (_, i) {
//                           var file = selectedModel.files[i];
//                           return GestureDetector(
//                             child: Image.file(
//                               File(file),
//                               fit: BoxFit.cover,
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 image = file;
//                               });
//                             },
//                           );
//                         },
//                         itemCount: selectedModel.files.length),
//                   )
//           ],
//         ),
//       ),
//     );
//   }

//   List<DropdownMenuItem<FileModel>> getItems() {
//     return files
//             .map((e) => DropdownMenuItem(
//                   child: Text(
//                     e.folder,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   value: e,
//                 ))
//             .toList() ??
//         [];
//   }
// }

class FileModel {
  late List<String> files;
  late String folder;

  FileModel({required this.files, required this.folder});

  FileModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }
}

/*final picker = ImagePicker();

  final pickedimage = ImagePicker().pickImage(source: ImageSource.gallery);

  // Future<XFile?> picker = ImagePicker().pickImage(source: ImageSource.gallery);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PostPicture Screen"),
          automaticallyImplyLeading: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 28.h),
          child: Container(
            color: Colors.white,
            child: Image.file(file)
        )));
  }
}*/

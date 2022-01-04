import 'package:get/get.dart';
import 'package:insta_layout/others/constants.dart';

class SearchController extends GetxController {
  RxBool left = true.obs;
  RxBool like = false.obs;
  RxInt likes = 0.obs;

  int onLikePressed() {
    return (likes += 1).value;
  }

  int onLikeUnpressed() {
    return (likes -= 1).value;
  }

  List images = [
    Constants.user0,
    Constants.userF,
    Constants.userF,
    Constants.userF,
    Constants.userM,
    Constants.userM,
    Constants.userF,
    Constants.userM,
    Constants.userF,
    Constants.userM,
    Constants.userF,
    Constants.userM,
  ];

  List postimages = [
    Constants.postImage,
    Constants.imagenotification,
    Constants.postImage,
    Constants.imagenotification,
    Constants.postImage,
    Constants.imagenotification,
    Constants.postImage,
    Constants.imagenotification,
    Constants.postImage,
    Constants.imagenotification,
  ];
}

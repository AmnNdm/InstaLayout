import 'package:get/get.dart';
import 'package:insta_layout/components/constants.dart';

class HomeController extends GetxController {
  bool isdark = false;

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

  List messages = [
    "Sent 1 hour ago",
    "Liked a message",
    "Sent 6 hours ago",
    "Sent 4 hours ago",
    "Sent 1 hour ago",
    "Sent 2 days ago",
    "Sent 7 hours ago",
    "Sent 8 hours ago",
    "Sent 1 hours ago",
    "Sent 9 hours ago",
    "Sent 10 hours ago",
    "Sent 1 hour ago",
  ];

  List<RxBool> like = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];
  RxInt likes = 0.obs;

  int onLikePressed() {
    return (likes += 1).value;
  }

  int onLikeUnpressed() {
    return (likes -= 1).value;
  }

  RxInt currentTab = 1.obs;
}

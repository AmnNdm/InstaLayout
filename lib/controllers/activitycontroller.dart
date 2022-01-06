import 'package:get/get.dart';
import 'package:insta_layout/components/constants.dart';

class ActivityController extends GetxController {
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

  List<String> splitStringByLength(String str, int length) =>
      [str.substring(0, length), str.substring(length)];

  String moreThan11(String b) {
    if (b.length <= 11) {
      return b;
    } else {
      List<String> listString = splitStringByLength(b, 10);
      return listString[0] + "...";
    }
  }
}

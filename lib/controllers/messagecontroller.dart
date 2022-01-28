import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/constants.dart';

class MessageController extends GetxController {
  // message screen
  RxInt currentTab = 1.obs;
  addButtonClick() async {
    List<User> u = [];
    alluserRef.once().then((event) {
      final data = event.snapshot.value as Map;
      if (data == null) {
        user.value = 1;
        addNewUser();
      } else {
        data.forEach((key, value) {
          final v = Map<dynamic, dynamic>.from(value);
          User user = User(id: v["id"] /*, name: v["name"]*/);
          u.add(user);
          print("length: ${u.length}");
        });
        print("last: ${u.last.id}");
        user.value = (u.length) + 1;
        addNewUser();
      }
    });
  }

  // inbox
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
    Constants.userF,
    Constants.userM,
    Constants.userF,
    Constants.userM,
    Constants.userF,
    Constants.userM,
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
    Constants.userF,
    Constants.userM,
    Constants.userF,
    Constants.userM,
    Constants.userF,
    Constants.userM,
  ];
  RxInt user = 0.obs;
  List<User> users = [];
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final DatabaseReference alluserRef =
      FirebaseDatabase.instance.ref().child("allusers");

  void addNewUser() {
    User u = User(/*name: "user$user",*/ id: user.toString());

    alluserRef.push().set(u.toJson());
    Message m = Message(
        content: "hello",
        type: "$user",
        time: DateTime.now().toString().split('.').first);
    print(m);
    sendMessage(m, "$user");
  }

  void userdata(Map d) {
    d.forEach((key, value) {
      final v = Map<dynamic, dynamic>.from(value);
      User u = User(id: v["id"] /*, name: v["name"]*/);
      users.add(u);

      // users.sort(/*(a, b) => a.id.compareTo(b.id)*/);
      print(users.length);
    });

    for (User eachuser in users) {
      for (User user in users) {
        if (int.parse(eachuser.id) < int.parse(user.id)) {
          String id = eachuser.id;
          eachuser.id = user.id;
          user.id = id;
        }
      }
    }
  }

  // chatscreen

  TextEditingController txtedtcontroller = TextEditingController();
  List<Message> messagesList = [];

  void sendMessage(Message message, String username) {
    DatabaseReference mref = dbRef.child(username);
    mref.push().set(message.toJson());
  }

  void messagedata(Map d) {
    d.forEach((key, value) {
      final v = Map<dynamic, dynamic>.from(value);
      Message m =
          Message(content: v["content"], type: v["type"], time: v["time"]);
      messagesList.add(m);

      // ignore: avoid_print
      print("length: ${messagesList.length}");
    });
    messagesList.toSet();
    messagesList.sort((b, a) => a.time.compareTo(b.time));
  }
}

class User {
  String id;
  // final String name;

  User({
    required this.id,
    // required this.name
  });

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        "id": id.toString(), /*"name": name.toString()*/
      };

  User.fromJson(Map<dynamic, dynamic> json) : id = json["text"] as String;
  /*name = json["text"] as String;*/
}

class Message {
  final String content;
  final String type;
  final String time;
  Message({required this.content, required this.type, required this.time});

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        "type": type.toString(),
        "content": content.toString(),
        "time": time.toString(),
      };

  Message.fromJson(Map<dynamic, dynamic> json)
      : type = json["text"] as String,
        content = json['text'] as String,
        time = json['text'] as String;
}

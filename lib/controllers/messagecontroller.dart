import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/constants.dart';

class MessageController extends GetxController {
  RxInt currentTab = 1.obs;
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

  TextEditingController txtedtcontroller = TextEditingController();

  RxInt user = 0.obs;
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final DatabaseReference alluserRef =
      FirebaseDatabase.instance.ref().child("allusers");

  addNewUser() {
    User u = User(/*name: "user$user",*/ id: user.toString());

    alluserRef.push().set(u.toJson());
    Message m = Message(
        content: "hello",
        type: "$user",
        time: DateTime.now().toString().split('.').first);
    print(m);
    sendMessage(m, "$user");
  }

  sendMessage(Message message, String username) {
    DatabaseReference mref = dbRef.child(username);
    mref.push().set(message.toJson());
  }

  // getMessage(int user) {
  //   DatabaseReference mref = dbRef.child("user$user");
  //   // mref.onChildChanged.listen((event) {
  //   //   final data = Map<dynamic, dynamic>.from(event.snapshot.value);
  //   //   final message =
  //   // })
  // }

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

import 'package:firebase_database/firebase_database.dart';

class MessagesDao {
  int user = 0;
  final DatabaseReference dbref = FirebaseDatabase.instance.ref();
  addNewUser() {
    user = user + 1;
    dbref.child("user $user");
  }
}

class Message {
  String content;
  String type;
  DateTime time;
  Message({required this.content, required this.type, required this.time});
}

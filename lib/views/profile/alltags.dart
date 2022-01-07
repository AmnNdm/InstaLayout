import 'package:flutter/cupertino.dart';

class AllTags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.38,
      child: Center(
        child: Text("All Tags"),
      ),
    );
  }
}

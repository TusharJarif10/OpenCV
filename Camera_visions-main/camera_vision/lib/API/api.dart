
import 'package:flutter/material.dart';

class GoggleLoginApi extends StatefulWidget {
  final String title;

  const GoggleLoginApi({Key key,  this.title}) : super(key: key);

  @override
  GoggleLoginApiState createState() => GoggleLoginApiState();
}

class GoggleLoginApiState extends State<GoggleLoginApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
    );
  }
}
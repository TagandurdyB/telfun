import 'package:flutter/material.dart';

import '/Models/Public.dart';
import 'imgBtn.dart';

class Model extends StatefulWidget {
 // const Model({Key? key}) : super(key: key);

  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  Widget build(BuildContext context) {
    return  ImgBtn(
      boxShadow: [BoxShadow(spreadRadius: 0,blurRadius: 7)],
      shape: SWi*0.03,
      width: SWi * 0.4,
      height: SWi * 0.32,
colors: [Colors.deepPurple,Colors.blue],
    );
  }
}

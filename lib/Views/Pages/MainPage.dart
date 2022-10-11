import 'package:flutter/material.dart';
import 'package:telfun/Models/connect.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/Plitcas.dart';
import '/Views/widgets/carusel_pro.dart';
import 'ScaffoldAll.dart';

class MainPage extends StatelessWidget {
  static String routName="/MainPage";
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get_api(
        URL: "$IP/api/categories",
        Return: Main());
  }

  ScaffoldAll Main() {
    return ScaffoldAll(
    IsSideBar: true,
    body: Container(
      child: ListView(
        children: [
          //MySlider1(),
         // MySlider(),
          Slider_pro(),
          Categories(),
        ],
      ),
    ),
  );
  }
}

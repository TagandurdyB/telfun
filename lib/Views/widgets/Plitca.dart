import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/connect.dart';
import 'package:telfun/Views/Pages/CategoriPage.dart';


import '/Models/Public.dart';

class Categori extends StatelessWidget {
  final List list;
  final int index;
  String str = "Telfonlar";
  Categori({Key key, this.list, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Provider.of<UsesVar>(context, listen: false).Select(0);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CategoriPage()));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(SWi * 0.05),
            boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 10)
            ],
            color: Color(0xff7262DF),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff8777FA), Color(0xffB493F0)])),
        margin: EdgeInsets.fromLTRB(15,7,15,7),
        height: SWi * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SWi * 0.05),
          child: Row(
            children: [
              Container(
                width: SWi * 0.3,
                height: SWi * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("$IP/storage/${list[index]["image"]}")
                  )
                ),
              ),
              SizedBox(width: SWi * 0.05),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text("${list[index]["name"]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontFamily: "ProximaSoftBold")),
                ),
              ),
              SizedBox(width: SWi * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

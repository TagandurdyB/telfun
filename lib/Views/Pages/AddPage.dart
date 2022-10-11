import 'package:flutter/material.dart';
import 'ScaffoldAll.dart';

class AddPage extends StatelessWidget {
   AddPage({Key key}) : super(key: key);
TextEditingController tel=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      IsAdd: true,
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLength: 6,
              controller: tel,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  //hintText: "Search same thing",
                  prefix: Text("+993",style: TextStyle(color: Colors.black),),
                  suffix: GestureDetector(
                      onTap: () =>
                      {tel.clear()} /*Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const MyApp()))*/
                      ,
                      child: Icon(Icons.cancel_rounded))),
            ),
          ),
    ));
  }
}

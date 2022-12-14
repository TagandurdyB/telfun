import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';

import 'DropDownBtn.dart';

class SortBtn extends StatelessWidget {
  // const SortBtn({Key? key}) : super(key: key);
List<String> filters=["Samsung","G9","3000TM","Gowy"];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: SWi * 0.03, right: SWi * 0.03),
        alignment: Alignment.centerRight,
        child: IconButton(
            onPressed: () {
              showDialog(context: context, builder:(context)=>
              CupertinoAlertDialog(
                title: Text("Filterler",style: TextStyle(fontSize: SWi*0.05),),
                content: Card(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("Marka:")),
                                DropdawnChange(0,["Samsung","Kartdan"]),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Model:")),
                                DropdawnChange(1,["G9","Kartdan"]),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Baha:")),
                                DropdawnChange(2,["3000TM","Kartdan"]),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("??agda??y:")),
                                DropdawnChange(3,["Gowy","Kartdan"]),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            /*    actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],*/
              )

              );
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SortPage()));
            },
            icon: Icon(
              Icons.align_horizontal_right_outlined,
              color: Colors.black,
            )));
  }


/*  DropdownButton<String> DropdawnChange(int value,List itims) {
    return DropdownButton(
      items: <String>["Nagyt", "Kartdan"].map((val) {
        return DropdownMenuItem(child: Text(val), value: val);
      }).toList(),
      value:filters[value],
      onChanged: (String newVal) {
        setState(() {
          value=="A??gabat"?region= newVal:payment= newVal;
        });
      },
    );
  }*/

}



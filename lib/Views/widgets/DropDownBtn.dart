import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';


class DropdawnChange extends StatefulWidget {
  final int index;
  final List<String> itims;
  DropdawnChange(this.index,this.itims);

  @override
  State<DropdawnChange> createState() => _DropdawnChangeState(itims);
}

class _DropdawnChangeState extends State<DropdawnChange> {
 final List<String> itims;
  _DropdawnChangeState(this.itims);

 String myvalue;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    myvalue=itims[0];
    if(filters.length<widget.index+1)
    filters.add(myvalue);
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: widget.itims.map((val) {
        return DropdownMenuItem(child: Text(val), value: val);
      }).toList(),
      value:filters[widget.index].toString(),
      onChanged: (String newVal) {
        setState(() {
          myvalue=newVal;
          filters[widget.index]=myvalue;
        });
      },
    );
  }
}
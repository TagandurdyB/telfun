import 'package:flutter/material.dart';

import '/Models/Public.dart';
import 'Plitca.dart';

class Categories extends StatelessWidget {
  //const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:List.generate(ApiList.length??0, (index) =>
Categori(list:ApiList,index: index)
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/Views/widgets/Model.dart';
import 'package:telfun/Views/widgets/SortBtn.dart';


class ModelPage extends StatelessWidget {
  //const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SortBtn(),
        Padding(
          padding: EdgeInsets.only(top: SWi * 0.05),
          child: Center(
            child: Wrap(
              runSpacing: SWi * 0.05,
              spacing: SWi * 0.07,
              children: [
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
                Model(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

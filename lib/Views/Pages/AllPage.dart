import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/Views/widgets/SortBtn.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';


class AllPage extends StatelessWidget {
  //const AllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
  SortBtn(),
        Column(
          children:   List.generate(10,
                  (index) => Padding(
                    padding:  EdgeInsets.only(top: SWi*0.05),
                    child: ImgBtn(
                      boxShadow: [BoxShadow(spreadRadius: 0,blurRadius: SWi*0.025)],
                shape: SWi*0.07,
                width: SWi,
                height: SWi * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(SWi*0.07),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(color: Colors.red,
                              width: 100,),
                            ),
                           Container(width: 1),
                           Expanded(
                               flex:2,child:  Container(
                             child: Align(
                               alignment: Alignment.centerLeft,
                               child: Padding(
                                 padding: EdgeInsets.only(left: SWi*0.08),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     FittedBox(
                                         fit: BoxFit.contain,
                                         child: Text("Samsungöş s22",style: TextStyle(fontSize: SWi*0.05,fontFamily: "NunitoRegular"))),
                                     Text("Mary",style: TextStyle(fontSize: SWi*0.04,fontFamily: "Itim")),
                                     Text("7.000 TMT",style: TextStyle(fontSize: SWi*0.045,fontFamily: "NunitoRegular")),
                                   ],
                                 ),
                               ),
                             ),
                             width: 200,
                             color: Colors.blue,))
                          ],
                        ),
                      ),
              ),
                  ))
        ),
      ],
    );
  }
}

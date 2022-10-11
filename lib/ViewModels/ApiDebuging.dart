import 'package:flutter/material.dart';
import '/Models/Public.dart';
import '/Models/connect.dart';



class Get_api extends StatelessWidget {
  final String URL;
  final Widget Return;
 // final int LIndex;
  const Get_api({
    Key key,
    @required this.URL,
    @required this.Return,
   // @required this.LIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: API(URL).getDate(),
        builder: (ctx, ss) {
            if (ss.hasError) {
            print("Error Fail***");
          }
          if (ss.hasData) {
            ApiList=ss.data;
            return Return;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
  }

/*class Post_api {
  final String URL, name, phone, region, district, payment;
  final List list;
  const Post_api({
    @required this.URL,
    @required this.list,
    @required this.name,
    @required this.phone,
    @required this.region,
    @required this.district,
    @required this.payment,
  });
  @override
  void addDate() {
    http.post(URL, body: {
      "name": name,
      "phone": phone,
      "region": region,
      "distriсt": district,
      "payment": payment,
      "products": list.toString(),
    });
  }
}*/

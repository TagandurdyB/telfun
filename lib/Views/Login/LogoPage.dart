import 'package:flutter/material.dart';
import 'package:telfun/Views/Pages/MainPage.dart';
import '/Models/Public.dart';
import '/Views/Login/LoginPage.dart';

class LogoPage extends StatelessWidget {
  static String routName = "/LogoPage";
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Logo();
  }
}

class Logo extends StatefulWidget {
  //const LogoPage({Key? key}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushReplacementNamed(MainPage.routName));
  }

  @override
  Widget build(BuildContext context) {
    SWi = MediaQuery.of(context).size.width;
    SHe = MediaQuery.of(context).size.height;
    print(SWi);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.black,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffFEC002),Color(0xffC544FF) ,Color(0xff5700FD)]
            ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                  colors: [Colors.red,Colors.blue]
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadiusDirectional.circular(30)
            ),
            width: SWi * 0.9,
            height: SWi * 0.3,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(20)
              ),
              width: SWi * 0.85,
              height: SWi * 0.25,
              alignment: Alignment.center,

              child: Text('Telfun',
                  style: TextStyle(
                      fontSize: SWi * 0.2,
                      fontFamily: "Soft",
                      fontWeight: FontWeight.w500,
                  color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

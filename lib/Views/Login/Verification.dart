import 'package:flutter/material.dart';
import '/Views/Login/verificationInput.dart';
import '/Views/Pages/MainPage.dart';
import '/Models/Public.dart';


class VerificationPage extends StatelessWidget {
  static String routName = "/Verification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: MyVarification(context),
    );
  }

  Widget MyVarification(context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            // color: Colors.blue,
            width: double.infinity,
            child: Container(
              height: 40,
              //  width: 200,
              //  color: Colors.red,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text("Verfications"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SWi * 0.15),
            height: SWi * 0.1,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                '''
a confirmation code has been sent to your
email. Please retype the code to
reset your Password
                ''',
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: SHe * 0.02),
          EnterOTP(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("00:00"),
              TextButton(onPressed: () {}, child: Text("Resend ?"))
            ],
          ),
          SizedBox(height: SHe * 0.02),
          Card(
            color: Color(0xff81A5FB),
            child: ListTile(
              onTap: () {
                print("salam");
                Navigator.pushNamedAndRemoveUntil(
                    context, MainPage.routName, (route) => false);
              },
              title: Center(
                  child: Text(
                "Set Password",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

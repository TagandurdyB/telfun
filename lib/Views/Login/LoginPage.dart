import 'package:flutter/material.dart';
import '/Models/SharedPref.dart';
import '/Models/Public.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SignUp.dart';
import 'Verification.dart';

void callTel(String num) async{
  await launch("tel://$num");
}

class LoginPage extends StatelessWidget {
  static String routName="/LogIn";
  //const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
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
                      child: Text("Log in your Account"),
                    ),
                  ),
                ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: SWi * 0.05),
                child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyInput(index: 0, hidden: "Adyňyz:"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyInput(index: 1, hidden: "Telefon Belgiňiz:",type: Type.pass),
                    ),
                    Remember(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.blue,
                        child: ListTile(
                          onTap: (){
                            Navigator.pushNamed(context, VerificationPage.routName);
                          },
                          title: Center(
                              child: Text(
                            "Log in",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text("New user?"),
                          ),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, SignUpPage.routName);
                          }, child: Text("Sigin up")),
                        ],),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<TextEditingController> controls = [];
enum Type{
  tel,pass,text,num,email
}

class MyInput extends StatefulWidget {
  final int index;
  final String hidden;
  final Type type;
  MyInput({this.index = 0, this.hidden = "",this.type=Type.text});
  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  void initState() {
    if (controls.length < widget.index + 1) {
      controls.add(TextEditingController());
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: widget.type==Type.tel?6:null,
        obscureText: widget.type==Type.pass?true:false,
        keyboardType: widget.type==Type.text?null:
        widget.type==Type.tel?
        TextInputType.phone:
        widget.type==Type.pass?
        TextInputType.visiblePassword:
        widget.type==Type.email?
        TextInputType.emailAddress:
        TextInputType.numberWithOptions(),
        controller: controls[widget.index],
        decoration: InputDecoration(
            prefix: widget.type==Type.tel?Text("+993"):null,
            /*  border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),*/
            labelText: widget.hidden,
            suffix: GestureDetector(
                onTap: () {
                  controls[widget.index].clear();
                },
                child: Icon(Icons.cancel))),
      ),
    );
  }
}

class Remember extends StatefulWidget {
  @override
  State<Remember> createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  bool select = RemenberMeEnable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: select,
                onChanged: (chenge) {
                  setState(() {
                    select = chenge ?? false;
                  });
                },
                shape: CircleBorder(),
              ),
              Text("Remember me"),
            ],
          ),
          TextButton(onPressed: () {
            callTel("+993000000");
          }, child: Text("Forgor pasword?")),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String routName="/SignUp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Log in")),
        ],
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.all(17),
        child: SignUpForm(context),
      ),
    );
  }

  Widget SignUpForm(BuildContext context) {
    return ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            //color: Colors.blue,
            width: double.infinity,
            child: Container(
              height: 40,
             // width: 100,
             // color: Colors.red,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text("Sign Up"),
              ),
            ),
          ),
          MyInput(index:  0,hidden: "Name"),
          MyInput(index:  1,hidden: "Email",type:Type.email),
          MyInput(index:  2,hidden: "Phone",type: Type.tel,),
          MyInput(index:  3,hidden: "Password",type: Type.pass,),
          MyInput(index:  4,hidden: "Confirm Password",type: Type.pass,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue,
              child: ListTile(
                onTap: (){print("salam");},
                title: Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text("If your already User?"),
                ),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Login now")),
              ],),
          )
        ],
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
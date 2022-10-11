import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/Views/Login/SignUp.dart';
import '/Views/Login/Verification.dart';
import '/Views/Login/LoginPage.dart';
import '/Views/Login/LogoPage.dart';
import '/Views/Pages/SetingsPage.dart';
import '/Models/Public.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/Pages/MainPage.dart';
import '/Views/Pages/SearchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserProperties.createSharedPObj();
  runApp(ChangeNotifierProvider<UsesVar>(
      create: (BuildContext context) => UsesVar(), child: MyApp()));
SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle( systemNavigationBarColor: Colors.transparent,));
SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Color(0xffF0EBFF),
          appBarTheme: AppBarTheme(
          color: Colors.white,
              iconTheme: IconThemeData(
                color: Color(0xff7163DF),
          )
      ),
      ),
      initialRoute: LogoPage.routName,
      routes: {
        MainPage.routName:(context)=>MainPage(),
        SetingsPage.routName:(context)=>SetingsPage(),
        SearchPage.routName:(context)=>SearchPage(),
        LogoPage.routName:(context)=>Logo(),
        LoginPage.routName:(context)=>LoginPage(),
        SignUpPage.routName:(context)=>SignUpPage(),
        VerificationPage.routName:(context)=>VerificationPage(),
      },
    );

  }
}


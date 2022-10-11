import 'package:flutter/material.dart';

double SWi=0.0,SHe=0.0;
int selectIndex = 0,oldSelect=0,_select=0;
List filters=[],ApiList=[];
String _Language="TU";

class CategoriObj{
  final String name,imgUrl;
  CategoriObj(this.name, this.imgUrl);
}


Widget telfun= ShaderMask(
  shaderCallback: (Rect bounds) {
    return RadialGradient(
      center: Alignment.centerLeft,
      radius: SWi*0.006,
      colors: <Color>[Color(0xff5700FD),Color(0xffC544FF) ,Color(0xffFEC002)],
      tileMode: TileMode.mirror,
    ).createShader(bounds);
  },
  child:  Text('Telfun',style:TextStyle(fontSize:SWi*0.06)),
);

TabController tabController;
class UsesVar extends ChangeNotifier {
  void TabChange(i) {
    tabController=i;
    notifyListeners();
  }
  TabController control(){
    return tabController;
  }
  void Select(i) {
    _select=i;
    notifyListeners();
  }
  int witchSelect(){
    return _select;
  }

  void ChangeLang(i) {
    _Language=i;
    notifyListeners();
  }

  String SelectLang(){
    return _Language;
  }


}
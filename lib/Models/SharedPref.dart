import 'package:shared_preferences/shared_preferences.dart';

List<String> _UserDetals=[];
bool RemenberMeEnable=false;


class SharedPBase{
  final List<String> UserDetalList;
  SharedPBase({this.UserDetalList});
  static SharedPreferences _SPUserDetals;

  Future<void> createSharedPObj() async {
    _SPUserDetals = await SharedPreferences.getInstance();
    //_SPLang = await SharedPreferences.getInstance();
  }

  void saveShPUser(List<String> value) {
    _SPUserDetals.setStringList("UserValue", value);
  }

  void loadShPUser() {
    _UserDetals = _SPUserDetals.getStringList("UserValue") ?? [];
  }

}
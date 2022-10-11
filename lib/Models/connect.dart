import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


const String IP="https://it.net.tm/telfun";

class API {
  final String URL;/*, name, phone, region, district, payment;*/


  API( this.URL/*, this.name, this.phone, this.region, this.district, this.payment,
      this.list,*/ );

  /*void addDate() {
    http.post(URL,
        body: {
      "name": name,
      "phone": phone,
      "region": region,
      "distriсt": district,
      "payment": payment,
      "products": list.toString(),
    });
  }*/

  Future<List> getDate() async {
    final response = await http.get(URL);
    return json.decode(response.body);
  }
}

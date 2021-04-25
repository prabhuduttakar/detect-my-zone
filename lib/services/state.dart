//import 'dart:convert';
//import 'package:http/http.dart' as http;
//
//List datas;
//var decodeddata;
//
//Future<String> getData() async {
//  var response = await http.get(
//    Uri.encodeFull(
//        "https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise'"),
//  );
//
//  this.setState(() {
//    decodeddata = jsonDecode(response.body);
//    datas = decodeddata['data']['statewise'];
//  });
//  return "Success!";
//}
//
//@override
//void initState() {
//  super.initState();
//  this.getData();
//}

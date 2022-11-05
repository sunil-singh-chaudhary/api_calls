import 'package:futurebuilder_demo/models/Autogenerated.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: camel_case_types
class services_api {
  Autogenerated? mList;
  Future<Autogenerated> autogeneratedDemo() async {
    var response = await http.get(Uri.https("dummyjson.com", "users"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsondata = json.decode(response.body);
      mList = Autogenerated.fromJson(jsondata);
    } else {
      print("error in auto response");
    }
    return mList!;
  }
}




// @override
  // void initState() {
  //    getData().then((value) {
  //      print(value);
  //    });
  //   autogeneratedDemo();
  //   super.initState();
  // }

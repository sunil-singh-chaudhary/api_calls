import 'package:futurebuilder_demo/ListviewItems/itemWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:futurebuilder_demo/models/Persional.dart';

class Futurebuilder extends StatefulWidget {
  const Futurebuilder({super.key});

  @override
  State<Futurebuilder> createState() => _FuturebuilderState();
}

class _FuturebuilderState extends State<Futurebuilder> {
  //https://dummyjson.com/users
  Future<List<Persional>> getFutureData() async {
    var list;
    var response = await http.get(Uri.https("dummyjson.com", "users"));
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      list = List.from(jsondata['users'])
          .map<Persional>((item) => Persional.fromJson(item))
          .toList();
    } else {
      print("error in response");
    }

    setState(() {});

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using FutureBuilder Api"),
      ),
      body: FutureBuilder<List<Persional>>(
        future: getFutureData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return itemWidget(user: snapshot.data![index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

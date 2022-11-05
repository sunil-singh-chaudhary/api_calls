import 'package:flutter/material.dart';
import 'package:futurebuilder_demo/ListviewItems/itemWidgetGetx.dart';

import 'package:futurebuilder_demo/usingGetxController/controller.dart';
import 'package:get/get.dart';

class GetxScreen extends StatefulWidget {
  const GetxScreen({super.key});

  @override
  State<GetxScreen> createState() => _GetxScreenState();
}

class _GetxScreenState extends State<GetxScreen> {
  var getcontroller = Get.put(controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using Getx Api"),
      ),
      body: Obx(() {
        return getcontroller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: getcontroller.getmodeldata.value.users!
                    .length, //getcontroller   snapdata.data!.users!.length
                itemBuilder: (context, index) {
                  print('V--->' +
                      getcontroller.getmodeldata.value.users![index].email!);
                  return itemWidgetGetx(
                      user: getcontroller.getmodeldata.value.users![index]);
                },
              );
      }),
    );
  }
}

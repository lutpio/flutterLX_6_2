import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tugas6_2/app/routes/app_pages.dart';

import '../controllers/read_controller.dart';

class ReadView extends GetView<ReadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailView'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!;
              // controller.titleController.text = data['title'];
              // controller.descriptionController.text = data['description'];
              return Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: const Text(
                        'Detail Resep Page',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Resep : ${data['title']}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Pembuatan : ${data['time_estimation']} menit",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Bahan-bahan : ${data['ingredients']}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Intruksi Pembuatan : ${data['instructions']}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.UPDATE, arguments: Get.arguments);
        },
        child: Text("Edit"),
      ),
    );
  }
}

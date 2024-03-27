import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tugas6_2/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.streamData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data!.size != 0) {
                var data = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () =>
                          Get.toNamed(Routes.READ, arguments: data[index].id),
                      // Get.toNamed(Routes.UPDATE, arguments: data[index].id),
                      title: Text(data[index]['title']),
                      subtitle:
                          Text("Estimasi : ${data[index]['time_estimation']}"),
                      trailing: IconButton(
                          onPressed: () =>
                              controller.deleteData(data[index].id),
                          icon: Icon(Icons.delete)),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No data'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CREATE);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

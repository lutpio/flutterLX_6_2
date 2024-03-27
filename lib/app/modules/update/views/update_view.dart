import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateView'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!;
              controller.titleController.text = data['title'];
              controller.timeController.text =
                  data['time_estimation'].toString();
              controller.ingredientsController.text = data['ingredients'];
              controller.instructionsController.text = data['instructions'];
              return Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: const Text(
                        'Update Resep Page',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: controller.titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Title',
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controller.timeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Time Estimation (minute)',
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 4,
                        controller: controller.ingredientsController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Ingredients',
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 4,
                        controller: controller.instructionsController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'instructions',
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          child: const Text('Save Changes'),
                          onPressed: () {
                            controller.updateData(
                                Get.arguments,
                                controller.titleController.text,
                                controller.ingredientsController.text,
                                controller.instructionsController.text,
                                int.parse(controller.timeController.text));
                          },
                        )),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

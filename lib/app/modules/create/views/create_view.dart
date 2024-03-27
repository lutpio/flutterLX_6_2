import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: const Text(
                'Add Resep Page',
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
                  child: const Text('Add'),
                  onPressed: () {
                    controller.addData(
                        controller.titleController.text,
                        controller.ingredientsController.text,
                        controller.instructionsController.text,
                        int.parse(controller.timeController.text));
                  },
                )),
          ],
        ),
      ),
    );
  }
}

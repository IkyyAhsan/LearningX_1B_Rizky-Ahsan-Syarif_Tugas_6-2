import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_6_2/app/modules/update/controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  final _formKey = GlobalKey<FormState>();

  UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Recipe'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'title',
                  ),
                ),
                TextFormField(
                  controller: controller.cookingTimeController,
                  decoration: const InputDecoration(labelText: 'time_estimation'),
                ),
                TextFormField(
                  controller: controller.ingredientsController,
                  decoration: const InputDecoration(labelText: 'ingredients'),
                  maxLines: null,
                ),
                TextFormField(
                  controller: controller.stepsController,
                  decoration: const InputDecoration(labelText: 'instructions'),
                  maxLines: null,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.updateRecipe();
                          }
                        },
                        child: const Text('Save'),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Panggil fungsi untuk menghapus resep di sini
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

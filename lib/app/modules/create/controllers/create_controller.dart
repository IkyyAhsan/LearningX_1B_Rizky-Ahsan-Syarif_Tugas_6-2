import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController cookingTimeController;
  late TextEditingController ingredientsController;
  late TextEditingController stepsController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    cookingTimeController = TextEditingController();
    ingredientsController = TextEditingController();
    stepsController = TextEditingController();
  }

  void addRecipe(String name, String cookingTime, String ingredients, String steps) {
    FirebaseFirestore.instance.collection('recipes').add({
      'name': name,
      'cookingTime': cookingTime,
      'ingredients': ingredients,
      'steps': steps,
    }).then((_) {
      Get.back();
    }).catchError((error) {
      print("Failed to add recipe: $error");
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    cookingTimeController.dispose();
    ingredientsController.dispose();
    stepsController.dispose();
    super.onClose();
  }
}

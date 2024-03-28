import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController cookingTimeController;
  late TextEditingController ingredientsController;
  late TextEditingController stepsController;
  late String recipeId = '';

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    cookingTimeController = TextEditingController();
    ingredientsController = TextEditingController();
    stepsController = TextEditingController();
  }

  void updateRecipe() {
    String name = nameController.text;
    String cookingTime = cookingTimeController.text;
    String ingredients = ingredientsController.text;
    String steps = stepsController.text;

    if (recipeId.isNotEmpty) {
      FirebaseFirestore.instance.collection('recipes').doc(recipeId).update({
        'name': name,
        'cookingTime': cookingTime,
        'ingredients': ingredients,
        'steps': steps,
      }).then((_) {
        Get.back();
      }).catchError((error) {
        if (kDebugMode) {
          print("Gagal memperbarui resep: $error");
        }
        // Tambahkan tindakan lain seperti menampilkan snackbar atau dialog untuk memberi tahu pengguna tentang kesalahan
      });
    }
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
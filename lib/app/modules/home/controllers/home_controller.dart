import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void addRecipe(String name, String cookingTime, String ingredients, String steps) {
    FirebaseFirestore.instance.collection('recipes').add({
      'name': name,
      'cookingTime': cookingTime,
      'ingredients': ingredients,
      'steps': steps,
    }).then((_) {
      // Jika berhasil menambahkan resep, navigasi kembali ke halaman sebelumnya
      Get.back();
    }).catchError((error) {
      // Cek apakah mode debug aktif sebelum mencetak pesan kesalahan
      if (kDebugMode) {
        print("Gagal menambahkan resep: $error");
      }
      // Tindakan tambahan bisa ditambahkan di sini, seperti menampilkan snackbar atau dialog
    });
  }

  void deleteRecipe(String id) {}
}

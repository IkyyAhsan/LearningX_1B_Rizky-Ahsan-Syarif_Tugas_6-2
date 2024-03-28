import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homework_6_2/app/modules/create/controllers/create_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD9C-8sOBraKPicjDqrI4oAI_zwZc0wzZY", 
      appId: "1:638635083259:android:f43a07043f5dc8ece8b75e", 
      messagingSenderId: "638635083259", 
      projectId: "lx-food-recipe-last"
      ),
  );
    Get.put(CreateController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

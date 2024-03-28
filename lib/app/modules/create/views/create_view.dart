import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_6_2/app/modules/create/controllers/create_controller.dart';

class AddRecipeForm extends GetView<CreateController> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cookingTimeController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _stepsController = TextEditingController();

  AddRecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: _cookingTimeController,
                decoration: const InputDecoration(labelText: 'Cooking Time'),
              ),
              TextFormField(
                controller: _ingredientsController,
                decoration: const InputDecoration(labelText: 'Ingredients'),
                maxLines: null, 
              ),
              TextFormField(
                controller: _stepsController,
                decoration: const InputDecoration(labelText: 'Steps'),
                maxLines: null, 
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _addRecipe,
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addRecipe() {
    String name = _nameController.text;
    String cookingTime = _cookingTimeController.text;
    String ingredients = _ingredientsController.text;
    String steps = _stepsController.text;

    // Add the recipe to Firestore using CreateController
    controller.addRecipe(name, cookingTime, ingredients, steps);

    // Navigate back to previous page after adding the recipe
    Get.back();
  }
}
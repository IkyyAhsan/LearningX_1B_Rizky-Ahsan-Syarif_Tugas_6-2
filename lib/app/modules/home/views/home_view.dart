import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework_6_2/app/modules/create/views/create_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep'),
      ),
      body: _buildRecipeList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddRecipeForm());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRecipeList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Text('Error');
        }
        final documents = snapshot.data!.docs;
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final doc = documents[index];
            return ListTile(
              title: Text(doc['name'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Waktu Memasak: ${doc['cookingTime'] ?? ''}'),
                  const SizedBox(height: 4),
                  Text('Bahan: ${doc['ingredients'] ?? ''}'),
                  const SizedBox(height: 4),
                  Text('Langkah-langkah: ${doc['steps'] ?? ''}'),
                ],
              ),
              onTap: () {
                // Navigate to update view here passing the document id
                Get.toNamed('/update', arguments: doc.id);
              },
            );
          },
        );
      },
    );
  }
}

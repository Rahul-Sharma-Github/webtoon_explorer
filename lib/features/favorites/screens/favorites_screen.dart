import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controllers/webtoon_controller.dart';

class FavoritesScreen extends StatelessWidget {
  final WebtoonController controller = Get.find();

  FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(
        () => controller.favorites.isEmpty
            ? const Center(child: Text('No favorites added yet.'))
            : ListView.builder(
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) {
                  var favorite = controller.favorites[index];
                  return ListTile(
                    title: Text(favorite),
                  );
                },
              ),
      ),
    );
  }
}

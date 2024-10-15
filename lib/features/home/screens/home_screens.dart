import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../details/screens/detail_screen.dart';
import '../controllers/webtoon_controller.dart';

class HomeScreen extends StatelessWidget {
  final WebtoonController controller = Get.put(WebtoonController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Webtoon Explorer')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.webtoonCategories.length,
          itemBuilder: (context, index) {
            var category = controller.webtoonCategories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ListTile(
                leading: Image.asset(category['image']!),
                title: Text(category['title']!),
                onTap: () {
                  // Navigate to Detail Screen
                  Get.to(() => DetailScreen(category: category));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

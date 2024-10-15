import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:webtoon_explorer/features/favorites/screens/favorites_screen.dart';
import '../../home/controllers/webtoon_controller.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> category;
  final WebtoonController controller = Get.find();

  DetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              category['image']!,

              // width: double.infinity,
              // height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              category['description']!,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ElevatedButton(
                onPressed: () {
                  controller.toggleFavorite(category['title']!);
                },
                child: Text(
                  controller.favorites.contains(category['title']!)
                      ? 'Remove from Favorites'
                      : 'Add to Favorites',
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Rate this Webtoon:'),
            RatingBar.builder(
              initialRating: double.parse(category['rating']!),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // controller.updateRating(rating);
                category['rating'] = rating.toString();
                controller.currentRating.value = category['rating']!;
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Average Rating: ${category['rating']}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => FavoritesScreen()),
              child: const Text('Go to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}

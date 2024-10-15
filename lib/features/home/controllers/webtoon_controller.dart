import 'package:get/get.dart';
import 'package:hive/hive.dart';

class WebtoonController extends GetxController {
  var webtoonCategories = <Map<String, String>>[].obs;
  var favorites = <String>[].obs;

  var defaultRating = 0.0.obs;
  var currentRating = '0.0'.obs;

  final _favoritesBox = Hive.box('favorites');

  @override
  void onInit() {
    super.onInit();
    fetchWebtoons();
    loadFavorites();
  }

  // Fetch webtoon categories (for demo, using static data)
  void fetchWebtoons() {
    webtoonCategories.assignAll([
      {
        'title': 'Romance',
        'image': 'assets/romance.jpg',
        'description': 'Top romantic webtoons with over 50 million views.',
        'rating': '0',
      },
      {
        'title': 'Fantasy',
        'image': 'assets/fantasy.jpg',
        'description': 'Epic fantasy webtoons with magical adventures.',
        'rating': '0',
      },
    ]);
  }

  // Load favorites from Hive
  void loadFavorites() {
    favorites.assignAll(_favoritesBox.keys.cast<String>().toList());
  }

  // Add or remove from favorites
  void toggleFavorite(String webtoonTitle) {
    if (favorites.contains(webtoonTitle)) {
      favorites.remove(webtoonTitle);
      _favoritesBox.delete(webtoonTitle);
    } else {
      favorites.add(webtoonTitle);
      _favoritesBox.put(webtoonTitle, true);
    }
  }

  // Update rating
  void updateRating(double rating) {
    currentRating.value = rating.toString();
  }
}

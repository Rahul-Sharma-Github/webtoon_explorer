import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/favorites/screens/favorites_screen.dart';
import 'features/home/screens/home_screens.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('favorites');

  runApp(const WebtoonExplorerApp());
}

class WebtoonExplorerApp extends StatelessWidget {
  const WebtoonExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webtoon Explorer',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: HomeScreen(),
      getPages: [
        GetPage(name: '/favorites', page: () => FavoritesScreen()),
      ],
    );
  }
}

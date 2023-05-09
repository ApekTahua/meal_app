import 'package:flutter/material.dart';
// import 'meal_app.dart';
import 'recipe_screen.dart';
import 'detail_screen.dart';
import 'tabs_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      // home: const CategoriesScreen(),
      routes: {
        '/': (context) => const TabsScreen(),
        RecipeScreen.routeName: (context) => const RecipeScreen(),
        DetailScreen.routeName: (context) => const DetailScreen(),
      },
    );
  }
}

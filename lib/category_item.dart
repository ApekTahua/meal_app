import 'package:flutter/material.dart';
import 'recipe_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color, {super.key});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(RecipeScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        //Center the text
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 75, horizontal: 5),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color, color.withOpacity(0.9)],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(200),
        ),
        //Center the text
        child: Text(
            Color.alphaBlend(Colors.white.withOpacity(0.8), color)
                        .computeLuminance() >
                    0.1
                ? title.toUpperCase()
                : title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

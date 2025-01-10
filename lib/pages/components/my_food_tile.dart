import 'package:flutter/material.dart';
import 'package:resturent_app/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const MyFoodTile({
    super.key,
    required this.food,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$' + food.price.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      food.description,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              //food item
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  food.image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          color: const Color.fromARGB(255, 215, 214, 214),
        )
      ]),
    );
  }
}

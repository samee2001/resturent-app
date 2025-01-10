import 'package:flutter/material.dart';

class MyDescryption extends StatelessWidget {
  const MyDescryption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("0.99"),
                Text("Delivery fee"),
              ],
            ),
            Column(
              children: [
                Text("15-30 min"),
                Text("Delivery time"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

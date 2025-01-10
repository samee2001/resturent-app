import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/models/food.dart';
import 'package:resturent_app/models/resturent.dart';
import 'package:resturent_app/pages/components/my_button.dart';

class FoodPage extends StatefulWidget {
  final Map<Addon, bool> selectedAddons = {}; // Map to store selected addons>
  final Food food;

  FoodPage({super.key, required this.food}) {
    //initialize selected addons to be false
    for (Addon addon in food.addons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to addd to cart

  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.addons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context
        .read<Resturent>()
        .addToCart(food, currentlySelectedAddons); // Get selected addons>
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.food.image,
                ),
              ),
            ),
            //food name
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food.name,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Food price
                        Text(
                          '\$${widget.food.price.toString()}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 12),
                        // Food description
                        Text(
                          widget.food.description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        SizedBox(height: 12),
                        Divider(
                          thickness: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        // Add-ons header
                        Text(
                          "Add-ons",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        // Add-ons list
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.food.addons.length,
                            itemBuilder: (context, index) {
                              // Get individual add-ons
                              Addon addon = widget.food.addons[index];
                              // Return checkbox UI
                              return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text('\$${addon.price.toString()}'),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] =
                                        value ?? false;
                                  });
                                  // Handle checkbox toggle
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),

                  // Add to cart button
                  Center(
                    child: MyButton(
                      title: "Add to Cart",
                      onTap: () =>
                          addToCart(widget.food, widget.selectedAddons),
                      text: 'Add to Cart',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

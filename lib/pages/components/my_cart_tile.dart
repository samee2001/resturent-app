import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/models/resturent.dart';
import 'package:resturent_app/pages/components/my_cart_items.dart';
import 'package:resturent_app/pages/components/my_quantity_selector.dart';

class MyCartTile extends StatelessWidget {
  final MyCartItems cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturent>(
        builder: (context, resturent, child) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //food image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          cartItem.food.image,
                          height: 100,
                          width: 100,
                        ),
                      ),

                      //name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('\$${cartItem.food.price}'),
                        ],
                      ),
                      Spacer(),
                      //increment or decrement quantity
                      MyQuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onIncrement: () {
                          resturent.addToCart(
                              cartItem.food, cartItem.selectedAddons);
                        },
                        onDecrement: () {
                          resturent.removeFromCart(cartItem);
                        },
                      ),
                    ],
                  ),
                ),

                //addons

                SizedBox(
                  height: cartItem.selectedAddons.isNotEmpty
                      ? 60
                      : 0, // Adjust height correctly
                  child: cartItem.selectedAddons.isNotEmpty
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: cartItem.selectedAddons.map((addon) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: FilterChip(
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        addon.name,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      // Add space between name and price
                                      Text(
                                        '\$${addon.price}',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  onSelected: (value) {},
                                  backgroundColor:
                                      const Color.fromARGB(255, 244, 244, 244),
                                  labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 12,
                                  ),
                                ));
                          }).toList(),
                        )
                      : const SizedBox
                          .shrink(), // Use SizedBox.shrink for empty addons
                )
              ],
            )));
  }
}

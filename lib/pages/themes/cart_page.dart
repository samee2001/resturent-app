import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/models/resturent.dart';
import 'package:resturent_app/pages/checkout.dart';
import 'package:resturent_app/pages/components/my_button.dart';
import 'package:resturent_app/pages/components/my_cart_tile.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturent>(
      builder: (context, resturent, child) {
        final userCart = resturent.cart;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.primary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:
                          Text("Are you sure you want to delete this cart?.."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            resturent.clearCart();
                          },
                          child: Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              //list of carts
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text("Cart is Empty"),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),

              MyButton(
                text: 'Checkout',
                title: "",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkout(),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}

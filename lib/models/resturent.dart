import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resturent_app/models/food.dart';
import 'package:resturent_app/pages/components/my_cart_items.dart';

class Resturent extends ChangeNotifier {
  //list of food menus
  final List<Food> _menu = [
    //burger
    Food(
      name: "Burger",
      image: "assets/burger/burger1.jpeg",
      category: FoodCategory.burger,
      description: 'A juicy beef burger with all the classic toppings.',
      price: 2.99,
      addons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "Bacon", price: 1.0),
        Addon(name: "Extra Patty", price: 2.0),
      ],
    ),
    Food(
      name: "Burger",
      image: "assets/burger/burger2.jpeg",
      category: FoodCategory.burger,
      description: 'A juicy beef burger with all the classic toppings.',
      price: 2.99,
      addons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "Bacon", price: 1.0),
        Addon(name: "Extra Patty", price: 2.0),
      ],
    ),
    Food(
      name: "Burger",
      image: "assets/burger/burger3.jpeg",
      category: FoodCategory.burger,
      description: 'A juicy beef burger with all the classic toppings.',
      price: 2.99,
      addons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "Bacon", price: 1.0),
        Addon(name: "Extra Patty", price: 2.0),
      ],
    ),
    Food(
      name: "Burger",
      image: "assets/burger/burger4.jpeg",
      category: FoodCategory.burger,
      description: 'A juicy beef burger with all the classic toppings.',
      price: 2.99,
      addons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "Bacon", price: 1.0),
        Addon(name: "Extra Patty", price: 2.0),
      ],
    ),
    Food(
      name: "Burger",
      image: "assets/burger/burger5.jpeg",
      category: FoodCategory.burger,
      description: 'A juicy beef burger with all the classic toppings.',
      price: 2.99,
      addons: [
        Addon(name: "Cheese", price: 0.5),
        Addon(name: "Bacon", price: 1.0),
        Addon(name: "Extra Patty", price: 2.0),
      ],
    ),
    //pizza

    Food(
      name: "Pizza",
      image: "assets/pizza/pizza1.jpeg",
      category: FoodCategory.pizza,
      description: 'A classic margherita pizza with fresh ingredients.',
      price: 3.99,
      addons: [
        Addon(name: "Extra Cheese", price: 0.7),
        Addon(name: "Pepperoni", price: 1.2),
        Addon(name: "Olives", price: 0.5),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(
            name: "Pineapple",
            price: 0.8), // Optional for fans of Hawaiian pizza
      ],
    ),
    Food(
      name: "Pizza",
      image: "assets/pizza/pizza2.jpeg",
      category: FoodCategory.pizza,
      description: 'A classic margherita pizza with fresh ingredients.',
      price: 3.99,
      addons: [
        Addon(name: "Extra Cheese", price: 0.7),
        Addon(name: "Pepperoni", price: 1.2),
        Addon(name: "Olives", price: 0.5),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(
            name: "Pineapple",
            price: 0.8), // Optional for fans of Hawaiian pizza
      ],
    ),
    Food(
      name: "Pizza",
      image: "assets/pizza/pizza3.jpeg",
      category: FoodCategory.pizza,
      description: 'A classic margherita pizza with fresh ingredients.',
      price: 3.99,
      addons: [
        Addon(name: "Extra Cheese", price: 0.7),
        Addon(name: "Pepperoni", price: 1.2),
        Addon(name: "Olives", price: 0.5),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(
            name: "Pineapple",
            price: 0.8), // Optional for fans of Hawaiian pizza
      ],
    ),
    Food(
      name: "Pizza",
      image: "assets/pizza/pizza4.jpeg",
      category: FoodCategory.pizza,
      description: 'A classic margherita pizza with fresh ingredients.',
      price: 3.99,
      addons: [
        Addon(name: "Extra Cheese", price: 0.7),
        Addon(name: "Pepperoni", price: 1.2),
        Addon(name: "Olives", price: 0.5),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(
            name: "Pineapple",
            price: 0.8), // Optional for fans of Hawaiian pizza
      ],
    ),
    Food(
      name: "Pizza",
      image: "assets/pizza/pizza5.jpeg",
      category: FoodCategory.pizza,
      description: 'A classic margherita pizza with fresh ingredients.',
      price: 3.99,
      addons: [
        Addon(name: "Extra Cheese", price: 0.7),
        Addon(name: "Pepperoni", price: 1.2),
        Addon(name: "Olives", price: 0.5),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(
            name: "Pineapple",
            price: 0.8), // Optional for fans of Hawaiian pizza
      ],
    ),

    //pazta
    Food(
      name: "Pasta",
      image: "assets/pasta/pazta1.jpeg",
      category: FoodCategory.pasta,
      description: 'Creamy Alfredo pasta with a hint of garlic.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Parmesan Cheese", price: 0.8),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(name: "Garlic Bread", price: 1.2),
        Addon(name: "Basil", price: 0.4),
      ],
    ),
    Food(
      name: "Pasta",
      image: "assets/pasta/pazta2.jpeg",
      category: FoodCategory.pasta,
      description: 'Creamy Alfredo pasta with a hint of garlic.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Parmesan Cheese", price: 0.8),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(name: "Garlic Bread", price: 1.2),
        Addon(name: "Basil", price: 0.4),
      ],
    ),
    Food(
      name: "Pasta",
      image: "assets/pasta/pazta3.jpeg",
      category: FoodCategory.pasta,
      description: 'Creamy Alfredo pasta with a hint of garlic.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Parmesan Cheese", price: 0.8),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(name: "Garlic Bread", price: 1.2),
        Addon(name: "Basil", price: 0.4),
      ],
    ),

    Food(
      name: "Pasta",
      image: "assets/pasta/pazta4.jpeg",
      category: FoodCategory.pasta,
      description: 'Creamy Alfredo pasta with a hint of garlic.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Parmesan Cheese", price: 0.8),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(name: "Garlic Bread", price: 1.2),
        Addon(name: "Basil", price: 0.4),
      ],
    ),

    Food(
      name: "Pasta",
      image: "assets/pasta/pasta5.jpeg",
      category: FoodCategory.pasta,
      description: 'Creamy Alfredo pasta with a hint of garlic.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Parmesan Cheese", price: 0.8),
        Addon(name: "Mushrooms", price: 0.6),
        Addon(name: "Garlic Bread", price: 1.2),
        Addon(name: "Basil", price: 0.4),
      ],
    ),

    //salad
    Food(
      name: "Salad",
      image: "assets/salad/salad1.jpeg",
      category: FoodCategory.salads,
      description: 'A fresh garden salad with crisp vegetables.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Avocado", price: 0.9),
        Addon(name: "Feta Cheese", price: 0.7),
        Addon(name: "Croutons", price: 0.5),
        Addon(name: "Balsamic Dressing", price: 0.4),
      ],
    ),
    Food(
      name: "Salad",
      image: "assets/salad/salad2.jpeg",
      category: FoodCategory.salads,
      description: 'A fresh garden salad with crisp vegetables.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Avocado", price: 0.9),
        Addon(name: "Feta Cheese", price: 0.7),
        Addon(name: "Croutons", price: 0.5),
        Addon(name: "Balsamic Dressing", price: 0.4),
      ],
    ),

    Food(
      name: "Salad",
      image: "assets/salad/salad3.jpeg",
      category: FoodCategory.salads,
      description: 'A fresh garden salad with crisp vegetables.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Avocado", price: 0.9),
        Addon(name: "Feta Cheese", price: 0.7),
        Addon(name: "Croutons", price: 0.5),
        Addon(name: "Balsamic Dressing", price: 0.4),
      ],
    ),

    Food(
      name: "Salad",
      image: "assets/salad/salad4.jpeg",
      category: FoodCategory.salads,
      description: 'A fresh garden salad with crisp vegetables.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Avocado", price: 0.9),
        Addon(name: "Feta Cheese", price: 0.7),
        Addon(name: "Croutons", price: 0.5),
        Addon(name: "Balsamic Dressing", price: 0.4),
      ],
    ),

    Food(
      name: "Salad",
      image: "assets/salad/salad5.jpeg",
      category: FoodCategory.salads,
      description: 'A fresh garden salad with crisp vegetables.',
      price: 2.99,
      addons: [
        Addon(name: "Grilled Chicken", price: 1.5),
        Addon(name: "Avocado", price: 0.9),
        Addon(name: "Feta Cheese", price: 0.7),
        Addon(name: "Croutons", price: 0.5),
        Addon(name: "Balsamic Dressing", price: 0.4),
      ],
    ),
  ];

  // Add this getter in the Resturent class
  List<MyCartItems> get cart => _cart;

  // ignore: recursive_getters
  List<Food> get menu => _menu;

  //user cart
  final List<MyCartItems> _cart = [];

  //add to cart

  void addToCart(Food food, List<Addon> selectedAddons) {
    // Check if the cart item already exists
    MyCartItems? cartItem = _cart.firstWhereOrNull(
      (item) {
        // Compare food
        bool isSameFood = item.food == food;

        // Compare add-ons
        bool isSameAddons =
            const ListEquality().equals(item.selectedAddons, selectedAddons);
        return isSameFood && isSameAddons;
      },
    );

    if (cartItem != null) {
      // If the item exists, increment the quantity
      cartItem.quantity++;
    } else {
      // If the item does not exist, add a new one to the cart
      _cart.add(
        MyCartItems(
          food: food,
          selectedAddons: selectedAddons,
          quantity: 1, // Ensure a default quantity
        ),
      );
    }
    notifyListeners(); // Notify UI of the changes
  }

  void removeFromCart(MyCartItems cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners(); // Notify UI of the changes
    }
  }

//get total price of the cart
  double getTotalCartPrice() {
    double totalPrice = 0.0;

    for (MyCartItems cartItem in _cart) {
      // Base price of the food item
      double itemTotal = cartItem.food.price;

      // Add price of selected add-ons
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      // Total price for this cart item (including quantity)
      totalPrice += (itemTotal) * cartItem.quantity;
    }

    return totalPrice;
  }

//get total numb of items in the cart
  int getTotalCartItems() {
    int totalItems = 0;

    for (MyCartItems cartItem in _cart) {
      totalItems += cartItem.quantity;
    }

    return totalItems;
  }

//clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //generate recipt

  String generateReceipt() {
    final recipt = StringBuffer();
    recipt.writeln('Here is your Receipt: ');

    //format the date to include upto seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    recipt.writeln('Date: $formattedDate');
    recipt.writeln();
    recipt.writeln('----------------------');

    for (final cartItem in _cart) {
      recipt.writeln(
          '${cartItem.quantity}x ${cartItem.food.name} {${_formatPrice(cartItem.food.price)}}');
      if (cartItem.selectedAddons.isNotEmpty) {
        recipt.writeln('Addons: ${_formatAddons(cartItem.selectedAddons)}');
      }
      recipt.writeln('----------------------');
    }
    recipt.writeln();
    recipt.writeln();
    recipt.writeln("Total Items: ${getTotalCartItems()}");
    recipt.writeln("Total Price: ${_formatPrice(getTotalCartPrice())}");

    return recipt.toString();
  }

  //format double value into money
  String _formatPrice(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => " ${addon.name} {${_formatPrice(addon.price)}}")
        .join(', ');
  }
}

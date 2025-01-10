import 'package:resturent_app/models/food.dart';

class MyCartItems {
  Food food;
  int quantity;
  List<Addon> selectedAddons;

  MyCartItems(
      {required this.food, this.quantity = 1, required this.selectedAddons});

  double get totalPrice {
    double addonesPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonesPrice) * quantity;
  }

  String get name => food.name;

  get price => null;
}

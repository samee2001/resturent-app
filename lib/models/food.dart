class Food {
  final String name;
  final String image;
  final String description;
  final double price;
  final FoodCategory category;
  final List<Addon> addons; // Addons required for the food

  Food({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
    required this.addons, // List of addons required
  });
}

// Enum for food categories
enum FoodCategory {
  burger,
  salads,
  pizza,
  pasta,
  soup,
}

// Addon class
class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });
}

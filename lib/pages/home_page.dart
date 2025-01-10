import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/models/food.dart';
import 'package:resturent_app/models/resturent.dart';
import 'package:resturent_app/pages/components/my_current_location.dart';
import 'package:resturent_app/pages/components/my_descryption_box.dart';
import 'package:resturent_app/pages/components/my_drawer.dart';
import 'package:resturent_app/pages/components/my_food_tile.dart';
import 'package:resturent_app/pages/components/my_sliverapp_bar.dart';
import 'package:resturent_app/pages/components/my_tab_bar.dart';
import 'package:resturent_app/pages/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belongd in a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

// Return a list of widgets, where each widget represents a category with its foods
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.toString().split('.').last, // Display the category name
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categoryMenu.length,
              itemBuilder: (context, index) {
                //get individual food
                final food = categoryMenu[index];

                return MyFoodTile(
                  food: food,
                  onTap: () {
                    // Navigate to the food details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodPage(food: food),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    }).toList(); // Convert Iterable<Widget> to List<Widget>
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverappBar(
            title: MyTabBar(tabController: _tabController),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  //current location
                  MyCurrentLocation(),
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  //descryption box

                  MyDescryption(),

                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ],
        body: Consumer<Resturent>(
          builder: (context, resturent, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(resturent.menu),
          ),
        ),
      ),
    );
  }
}

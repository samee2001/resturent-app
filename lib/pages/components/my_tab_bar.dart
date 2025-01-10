import 'package:flutter/material.dart';
import 'package:resturent_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  // Build category tabs
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.name.toLowerCase(), // Display category name in uppercase
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:resturent_app/pages/themes/cart_page.dart';

class MySliverappBar extends StatefulWidget {
  final Widget title;
  final Widget child;
  const MySliverappBar({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<MySliverappBar> createState() => _MySliverappBarState();
}

class _MySliverappBarState extends State<MySliverappBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      collapsedHeight: 100,
      floating: false,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        "Sameera Cafe",
      ),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: widget.child,
        title: widget.title,
        expandedTitleScale: 1.5,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 20, right: 20),
      ),
    );
  }
}

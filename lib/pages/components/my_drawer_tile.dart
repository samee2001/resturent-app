import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      title: Text(
        title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
      ),
      leading: icon != null
          ? Icon(
              icon,
              size: 24,
            )
          : null,
      onTap: onTap,
    );
  }
}

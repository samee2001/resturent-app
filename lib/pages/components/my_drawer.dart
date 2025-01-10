import 'package:flutter/material.dart';
import 'package:resturent_app/pages/components/my_drawer_tile.dart';
import 'package:resturent_app/pages/settings_page.dart';

import '../services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() async {
    final authService = AuthServices();
    await authService.signOut();
    
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(children: [
          //app logo as icon
          Icon(Icons.lock_open_rounded, size: 100),
          Text(
            "Food Delivery App",
            style: TextStyle(fontSize: 20),
          ),

          //divider
          Divider(
            thickness: 2,
            color: const Color.fromARGB(255, 215, 214, 214),
          ),

          //homelist tile

          MyDrawerTile(
              title: "Home",
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              }),

          //settings list tile
          MyDrawerTile(
              title: "Settings",
              icon: Icons.settings,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingsPage();
                }));
              }),

          //about us
          MyDrawerTile(title: "About Us", icon: Icons.man, onTap: () {}),

          //contact
          MyDrawerTile(title: "Contact", icon: Icons.call, onTap: () {}),

          //logout list tile
          Spacer(),
          MyDrawerTile(title: "Logout", icon: Icons.logout, onTap: logout),
        ]),
      ),
    );
  }
}

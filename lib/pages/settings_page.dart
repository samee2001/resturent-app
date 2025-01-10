import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/pages/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      //cupertino switch widget to switch between light and dark mode
                      CupertinoSwitch(
                        value:
                            Provider.of<ThemeProvider>(context, listen: false)
                                .isDarkMode,
                        onChanged: (value) =>
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme(),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

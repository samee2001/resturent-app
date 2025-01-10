import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Enter your address"),
              content: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your address",
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Save"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Delivery now",
          ),
          GestureDetector(
            onTap: () => openLocationSearchbox(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //address
                Text("Homagama, Sri Lanka"),

                //icon
                Icon(Icons.keyboard_arrow_down),

                //dropdown menu
              ],
            ),
          ),
        ],
      ),
    );
  }
}

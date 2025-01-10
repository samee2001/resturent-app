import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturent_app/models/resturent.dart';
import 'package:resturent_app/pages/services/database/firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //get access to the database
  final Firestore db = Firestore();

  @override
  void initState() {
    super.initState();

    String recipt = context.read<Resturent>().generateReceipt();
    db.saveOrderTODatabase(recipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Delivery Progress"),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Thank You For Your Order..!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //animation

            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Consumer<Resturent>(
                  builder: (context, resturent, child) => Text(
                    resturent.generateReceipt(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text("Estimated Delivery Time: 15 - 30 min"),
          ],
        ),
      ),
    );
  }

  //custom bottom navigation bar to message and call delivery driver
  Widget _bottomNavigationBar(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sameera",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Driver",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

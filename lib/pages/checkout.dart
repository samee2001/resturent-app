import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:resturent_app/pages/components/my_button.dart';
import 'package:resturent_app/pages/delivery_progress_page.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cvvCode = '';
  String cardHolderName = '';
  bool showBackView = false; // Default to false for front view

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV Code: $cvvCode"),
              ],
            ),
          ),
          actions: [
            // Cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            // Confirm button
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeliveryProgressPage()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Center(
                      child: Text("Payment Successful!"),
                    ),
                  ),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckOut"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              onCreditCardWidgetChange: (p0) {},
            ),
            CreditCardForm(
              formKey: formKey,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
            ),
            const SizedBox(height: 15),
            MyButton(
              text: "Pay Now",
              title: '',
              onTap: userTappedPay,
            ),
          ],
        ),
      ),
    );
  }
}

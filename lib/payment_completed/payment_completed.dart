import 'package:flutter/material.dart';
import 'package:flutter_store_app/home/home_screen.dart';
import 'package:flutter_store_app/utils/colors.dart';

class PaymentCompleted extends StatefulWidget {
  const PaymentCompleted({super.key});

  static const tag = "paymentCompleted/";

  @override
  State<PaymentCompleted> createState() => _PaymentCompletedState();
}

class _PaymentCompletedState extends State<PaymentCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.snow,
      body: body(),
    );
  }

  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: CustomColors.green,
            size: 100,
          ),
          const Text(
            "Order Placed Successfully",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.limedAsh,
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, HomeScreen.tag),
              child: const Text(
                "Go Home",
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

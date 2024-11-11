import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_app/home/home_screen.dart';
import 'package:flutter_store_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const tag = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.limedAsh,
            CustomColors.greyGreen,
            CustomColors.sage,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const AutoSizeText(
            "Style Over Fashion",
            style: TextStyle(
              fontSize: 50,
              color: CustomColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const AutoSizeText(
            "This shoe is the perfect choice for enyone looking"
            "for style and confort all in one. Whith a modern and"
            "elegant design, ithas a premium..",
            style: TextStyle(
              fontSize: 18,
              color: CustomColors.white,
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.tag);
              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

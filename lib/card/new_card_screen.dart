import "package:flutter/material.dart";
import "package:flutter_store_app/mixin/products_mixin.dart";
import "package:flutter_store_app/utils/colors.dart";
import "package:flutter_svg/flutter_svg.dart";

class NewCardScreen extends StatefulWidget {
  const NewCardScreen({super.key});

  static const tag = "/newCard";

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> with ProdutsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.snow,
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            appBar(),
            const SizedBox(height: 40),
            addCard(),
            const SizedBox(height: 40),
            changePayment(),
            const SizedBox(height: 40),
            checkoutButton(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        const SizedBox(width: 10),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              color: CustomColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 0,
                  color: CustomColors.grey,
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
            ),
          ),
        ),
        const SizedBox(width: 100),
        const Text(
          "Payment",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget addCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 250,
          width: mediaWidth * 0.7,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.limedAsh,
                CustomColors.greyGreen,
                CustomColors.sage,
              ],
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        InkWell(
          onTap: () => newCardbottomsheet(),
          child: Container(
            height: 250,
            width: mediaWidth * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: CustomColors.green,
              ),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget changePayment() {
    return Column(
      children: [
        const Text(
          "Other way to pay",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        selectCard("Master Card", "assets/mastercard-logo.svg"),
        selectCard("Apple pay", "assets/apple-pay.svg"),
        selectCard("Cielo payment", "assets/cielo-1.svg"),
      ],
    );
  }

  Widget selectCard(String text, String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 70,
        decoration: BoxDecoration(
          color: CustomColors.snow,
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 0,
              color: CustomColors.grey,
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: SvgPicture.asset(asset),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Checkbox(
              value: isChecked,
              shape: const CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  check = text;
                  text == check ? isChecked = value! : false;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future newCardbottomsheet() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: CustomColors.greyGreen,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Add New Card",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              cardInput(),
              const SizedBox(height: 15),
              Row(
                children: [
                  cardInput(),
                  const SizedBox(width: 15),
                  cardInput(),
                ],
              ),
              const SizedBox(height: 15),
              cardInput(),
              const SizedBox(height: 15),
              cardInput(),
              const SizedBox(height: 25),
              newCardButton(),
            ],
          ),
        );
      },
    );
  }

  Widget cardInput() {
    return Flexible(
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          fillColor: CustomColors.sage,
          filled: true,
        ),
      ),
    );
  }

  Widget newCardButton() {
    return SizedBox(
      height: 55,
      width: mediaWidth * 0.8,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.limedAsh,
        ),
        child: const Text(
          "Add New Card",
          style: TextStyle(
            color: CustomColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget checkoutButton() {
    return SizedBox(
      height: 55,
      width: mediaWidth * 0.8,
      child: ElevatedButton(
        onPressed: () => checkoutBottomSheet(),
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.limedAsh,
        ),
        child: const Text(
          "Checkout",
          style: TextStyle(
            color: CustomColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Future checkoutBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [Container()],
        );
      },
    );
  }
}

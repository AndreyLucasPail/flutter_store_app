import "package:flutter/material.dart";
import "package:flutter_store_app/mixin/products_mixin.dart";
import "package:flutter_store_app/payment_completed/payment_completed.dart";
import "package:flutter_store_app/provider/card_provider.dart";
import "package:flutter_store_app/provider/cart_provider.dart";
import "package:flutter_store_app/utils/colors.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:mask_text_input_formatter/mask_text_input_formatter.dart";
import "package:provider/provider.dart";

class PaymentScreenArgs {
  PaymentScreenArgs(this.totalPrice);

  double totalPrice;
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, this.totalPrice});

  static const tag = "/newCard";

  final double? totalPrice;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> with ProdutsMixin {
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
        child: Consumer2<CardProvider, CartProvider>(
          builder: (_, cardProvider, cartProvider, __) {
            return Column(
              children: [
                const SizedBox(height: 40),
                appBar(),
                const SizedBox(height: 40),
                addCard(cardProvider),
                const SizedBox(height: 40),
                changePayment(),
                const SizedBox(height: 40),
                checkoutButton(cardProvider),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        const SizedBox(width: 10),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 25,
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

  Widget addCard(CardProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset("assets/mastercard-logo.svg"),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  provider.card.isNotEmpty
                      ? provider.currentCard["number"]
                      : "xxxxxxxxxxx",
                  style: const TextStyle(
                    color: CustomColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.card.isNotEmpty
                        ? provider.currentCard["name"]
                        : "xxxxxxxxxxx",
                    style: const TextStyle(
                      color: CustomColors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    provider.card.isNotEmpty
                        ? provider.currentCard["date"]
                        : "xxxx",
                    style: const TextStyle(
                      color: CustomColors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => newCardbottomsheet(provider),
          child: Container(
            height: 250,
            width: mediaWidth * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: CustomColors.limedAsh,
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

  Future newCardbottomsheet(CardProvider provider) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomColors.snow,
      builder: (context) {
        return Form(
          key: cardKey,
          child: SizedBox(
            height: mediaHeight * 0.6,
            child: Padding(
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
                  cardInput("Name", "Name", nameController, cardNameValidator),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      cardInput("CVV", "CVV", cvvController, cardCVValidator),
                      const SizedBox(width: 15),
                      cardDateInput("Date", "Date", dateController),
                    ],
                  ),
                  const SizedBox(height: 15),
                  cardNumberInput(
                      "Card Number", "Card Number", numberController),
                  const SizedBox(height: 15),
                  cardCpfInput("CPF", "CPF", cpfController),
                  const SizedBox(height: 25),
                  newCardButton(provider),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cardInput(
    String hintText,
    String labelText,
    TextEditingController controller,
    String? Function(String?)? validator,
  ) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
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

  Widget cardNumberInput(
    String hintText,
    String labelText,
    TextEditingController controller,
  ) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        validator: cardNumValidator,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          fillColor: CustomColors.sage,
          filled: true,
        ),
        inputFormatters: [
          MaskTextInputFormatter(
            mask: 'xxxx-xxxx-xxxx-xxxx',
            filter: {'x': RegExp(r'[0-9]')},
          ),
        ],
      ),
    );
  }

  Widget cardCpfInput(
    String hintText,
    String labelText,
    TextEditingController controller,
  ) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        validator: cardCPFValidator,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          fillColor: CustomColors.sage,
          filled: true,
        ),
        inputFormatters: [
          MaskTextInputFormatter(
            mask: 'xxx-xxx-xxx-xx',
            filter: {'x': RegExp(r'[0-9]')},
          ),
        ],
      ),
    );
  }

  Widget cardDateInput(
    String hintText,
    String labelText,
    TextEditingController controller,
  ) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        validator: cardDateValidator,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          fillColor: CustomColors.sage,
          filled: true,
        ),
        inputFormatters: [
          MaskTextInputFormatter(
            mask: 'xx/xx/xxxx',
            filter: {'x': RegExp(r'[0-9]')},
          ),
        ],
      ),
    );
  }

  Widget newCardButton(CardProvider provider) {
    return SizedBox(
      height: 55,
      width: mediaWidth * 0.8,
      child: ElevatedButton(
        onPressed: () {
          if (cardKey.currentState!.validate()) {
            provider.newCard(
              {
                "name": nameController.text,
                "number": numberController.text,
                "cvv": cvvController.text,
                "date": dateController.text,
                "cpf": cpfController.text,
              },
            );
            nameController.clear();
            numberController.clear();
            cvvController.clear();
            dateController.clear();
            cpfController.clear();
            Navigator.pop(context);
          }
        },
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

  Widget checkoutButton(CardProvider cardProvider) {
    return SizedBox(
      height: 55,
      width: mediaWidth * 0.8,
      child: ElevatedButton(
        onPressed: () => cardProvider.card.isNotEmpty
            ? checkoutBottomSheet(cardProvider)
            : snackBar("Add a Card"),
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

  Future checkoutBottomSheet(CardProvider cardProvider) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: CustomColors.snow,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return DraggableScrollableSheet(
              snap: true,
              expand: false,
              initialChildSize: 0.7,
              builder: (context, controller) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "Payment",
                          style: TextStyle(
                            color: CustomColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        paymentMethod(
                          state,
                          cardProvider.currentCard,
                        ),
                        const SizedBox(height: 30),
                        address(cardProvider),
                        const SizedBox(height: 250),
                        totalBag(selecInstallments),
                        const SizedBox(height: 20),
                        payButton(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget paymentMethod(
    Function state,
    Map<String, dynamic> currentCard,
  ) {
    String cardNumber = currentCard["number"];

    String fourDigits = cardNumber.substring(cardNumber.length - 4);
    return ExpansionTile(
      shape: Border.all(
        color: CustomColors.black,
      ),
      leading: SizedBox(
        height: 50,
        width: 50,
        child: SvgPicture.asset("assets/mastercard-logo.svg"),
      ),
      childrenPadding: const EdgeInsets.all(16.0),
      title: Column(
        children: [
          Text("****$fourDigits"),
          const Text("Payment method"),
        ],
      ),
      children: List.generate(
        12,
        (index) => installment(index + 1, state),
      ),
    );
  }

  Widget installment(int number, Function state) {
    return InkWell(
      onTap: () {
        state(() {
          selecInstallments = number;
        });
      },
      child: Row(
        children: [
          Text(
            "${number}X",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "Of",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "\$${(widget.totalPrice! / number).toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            "\$${widget.totalPrice!.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          selecInstallments == number ? const Icon(Icons.check) : Container(),
        ],
      ),
    );
  }

  Widget address(CardProvider cardProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: CustomColors.grey300,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            size: 30,
            Icons.house,
            color: CustomColors.black,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Delivery Address",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            cardProvider.currentAddress.isNotEmpty
                ? Text(
                    "${cardProvider.currentAddress["street"]} /"
                    " ${cardProvider.currentAddress["country"]}, "
                    "${cardProvider.currentAddress["number"]}",
                    style: const TextStyle(
                      color: CustomColors.black,
                    ),
                  )
                : const Text(
                    "add a address",
                    style: TextStyle(
                      color: CustomColors.black,
                    ),
                  ),
          ],
        ),
        InkWell(
          onTap: () => addressDialog(cardProvider),
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: CustomColors.grey300,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              size: 30,
              Icons.create_rounded,
              color: CustomColors.black,
            ),
          ),
        ),
      ],
    );
  }

  Future addressDialog(CardProvider cardProvider) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            height: mediaHeight * 0.55,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Add address",
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  addressInput(streetController, "Street", "Street"),
                  const SizedBox(height: 20),
                  addressInput(houseNumController, "Number", "Number"),
                  const SizedBox(height: 20),
                  addressInput(cityController, "City", "City"),
                  const SizedBox(height: 20),
                  addressInput(countryController, "Country", "Country"),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: mediaWidth * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        cardProvider.newAddress(
                          {
                            "street": streetController.text,
                            "number": houseNumController.text,
                            "city": cityController.text,
                            "country": countryController.text,
                          },
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.sage,
                      ),
                      child: const Text(
                        "Add Address",
                        style: TextStyle(
                          color: CustomColors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget addressInput(
    TextEditingController controller,
    String hintText,
    String labelText,
  ) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: CustomColors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.black,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
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

  Widget totalBag(int number) {
    return Row(
      children: [
        const Text(
          "Total:",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          "${number}X of \$${(widget.totalPrice! / number).toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget payButton() {
    return Row(
      children: [
        const Spacer(),
        SizedBox(
          height: 45,
          width: mediaWidth * 0.35,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.limedAsh,
            ),
            onPressed: () => Navigator.pushNamed(context, PaymentCompleted.tag),
            child: const Text(
              "Buy now",
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

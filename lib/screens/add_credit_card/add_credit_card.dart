import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_button.dart';
import 'package:fashion/componants/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddCreditCard extends StatefulWidget {
  const AddCreditCard({super.key, this.editData});
  final dynamic editData;

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isShow = false;
  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.editData != null) {
      cardNumber = widget.editData["cardNumber"] ?? "";
      expiryDate = widget.editData["expiryDate"] ?? "";
      cardHolderName = widget.editData["cardHolderName"] ?? "";
      cvvCode = widget.editData["cvvCode"] ?? "";
      isShow = widget.editData["isShow"] ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(isBlackk: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Header(title: "Payment method".toUpperCase()),
                Gap(15),
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  obscureCardCvv: false,
                  obscureCardNumber: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.black,
                ),
                CreditCardForm(
                  formKey: _key,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  isCardHolderNameUpperCase: true,
                  obscureCvv: false,
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
                Gap(140),
                CustomButton(
                  isSvgg: false,
                  titel: "Add Card".toUpperCase(),
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all the fields")),
                      );
                    } else {
                      final data = {
                        "number": cardNumber,
                        "name": cardHolderName,
                        "date": expiryDate,
                        "cvv": cvvCode,
                      };
                      GoRouter.of(context).pop(data);
                    }
                  },
                ),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      expiryDate = data.expiryDate;
      cvvCode = data.cvvCode;
      isShow = data.isCvvFocused;
    });
  }
}

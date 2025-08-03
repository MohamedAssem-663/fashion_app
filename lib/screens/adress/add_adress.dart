import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_button.dart';
import 'package:fashion/componants/custom_text_filed.dart';
import 'package:fashion/componants/header.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddAdress extends StatefulWidget {
  final ProductModel product;
  final dynamic editData;

  const AddAdress({super.key, required this.product, this.editData});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.editData != null) {
      firstNameController.text = widget.editData["first"] ?? "";
      lastNameController.text = widget.editData["last"] ?? "";
      addressController.text = widget.editData["address"] ?? "";
      stateController.text = widget.editData["state"] ?? "";
      zipCodeController.text = widget.editData["zip code"] ?? "";

      cityController.text = widget.editData["city"] ?? "";
      phoneController.text = widget.editData["phone"] ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Header(title: "Add Adress".toUpperCase()),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: "First Name",
                          controller: firstNameController,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          label: "Last Name",
                          controller: lastNameController,
                        ),
                      ),
                    ],
                  ),
                  Gap(16),
                  CustomTextField(
                    label: "Address",
                    controller: addressController,
                  ),
                  Gap(16),

                  CustomTextField(label: "City", controller: cityController),
                  Gap(16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: "State",
                          controller: stateController,
                        ),
                      ),
                      Gap(16),
                      Expanded(
                        child: CustomTextField(
                          label: "ZIP Code",
                          keyboardType: TextInputType.number,
                          controller: zipCodeController,
                        ),
                      ),
                    ],
                  ),
                  Gap(16),
                  CustomTextField(
                    label: "Phone Number",
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                  ),
                  SizedBox(height: 230),
                  CustomButton(
                    isSvgg: false,
                    titel: "Add Now".toUpperCase(),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        return;
                      } else {
                        final addressData = {
                          'firstName': firstNameController.text,
                          'lastName': lastNameController.text,
                          'address': addressController.text,
                          'city': cityController.text,
                          'state': stateController.text,
                          'zipCode': zipCodeController.text,
                          'phone': int.tryParse(phoneController.text) ?? 0,
                        };

                        GoRouter.of(context).pop(addressData);
                      }
                    },
                  ),
                  const Gap(30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

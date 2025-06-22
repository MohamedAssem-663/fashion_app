import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_button.dart';
import 'package:fashion/componants/custom_text_filed.dart';
import 'package:fashion/componants/header.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Header(title: "Add Adress".toUpperCase()),
            Form(
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
                    label: "Adress",
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
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              isSvgg: false,
              titel: "Add Now".toUpperCase(),
              onTap: () {
                // Example: Use the values
                print("First name: ${firstNameController.text}");
              },
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}

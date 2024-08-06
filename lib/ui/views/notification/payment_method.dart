import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:growsmart/ui/common/ui_helpers.dart';

import '../../common/app_colors.dart';
import '../../components/submit_button.dart';
import '../../components/success_page.dart';
import '../../components/text_field_widget.dart';

class CardView extends StatelessWidget {
  final cardNumber = TextEditingController();
  final expiryDate = TextEditingController();
  final cvv = TextEditingController();
  final country = TextEditingController();
  final postcode = TextEditingController();

  CardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Premium"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/card.png",
                    height: 100, // Adjust the height to make the image visible
                    width: 100, // Optional: Adjust the width if needed
                  ),
                  Image.asset(
                    "assets/images/googleecard.png",
                    height: 100, // Adjust the height to make the image visible
                    width: 100, // Adjust the height to make the image smaller
                  ),
                  Image.asset(
                    "assets/images/paypalcard.png",
                    height: 100, // Adjust the height to make the image visible
                    width: 100, // Optional: Adjust the width if needed
                  ),
                ],
              ),
              TextFieldWidget(
                hint: "Enter card Number",
                controller: cardNumber,
                inputType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'required';
                  }
                  return null; // Return null to indicate no validation error
                },
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hint: "Expiry Date",
                      controller: expiryDate,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'required';
                        }
                        return null; // Return null to indicate no validation error
                      },
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: TextFieldWidget(
                      hint: "CVV",
                      controller: cvv,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'required';
                        }
                        return null; // Return null to indicate no validation error
                      },
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hint: "Country",
                      controller: country,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'required';
                        }
                        return null; // Return null to indicate no validation error
                      },
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: TextFieldWidget(
                      hint: "Post code",
                      controller: postcode,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'required';
                        }
                        return null; // Return null to indicate no validation error
                      },
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SubmitButton(
                  isLoading: false,
                  label: "Next",
                  submit: () {
                    {
                      // locator<NavigationService>().clearStackAndShow(Routes.CardView);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessPage(title: 'Success!', description: 'You have subscribed for GrowSmart premium successfully, stay tuned for daily health reminders tailor-made for you.',)),
                      );
                    }

                  },
                  color: kcPrimaryColor,
                  boldText: true,
                ),
              ),
            ],

          ),

        ),

      ),

    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CardView(),
  ));
}

import 'package:flutter/material.dart';
import 'package:growsmart/ui/common/app_colors.dart';
import 'package:growsmart/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../components/submit_button.dart';

class OnboardingView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center( // Added Center widget here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Before we get started',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                verticalSpaceLarge,
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: kcBlackColor, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Please read our ",
                      ),
                      TextSpan(
                        text: "Privacy Policy ",
                        style: TextStyle(color: kcPrimaryColor),
                      ),
                      TextSpan(
                        text:
                        'and confirm the following declarations. Consents can be withdrawn in Profile Settings at any time.',
                      ),
                    ],
                  ),
                ),
                verticalSpaceLarge,
                Text(
                  'I agree to GrowSmart’s Terms & Conditions and confirm that I am at least 16 years old.',
                  style: TextStyle(
                      color: kcBlackColor, fontSize: 14),
                ),
                verticalSpaceLarge,
                Text(
                  'I consent to GrowSmart using any personal health data I voluntarily share here so GrowSmart can create and personalize my account and provide health assessments and guidance.',
                  style: TextStyle(color: kcBlackColor, fontSize: 14),
                ),
                Spacer(),
                Center(
                  child: SubmitButton(
                    isLoading: false,
                    label: "Next",
                    submit: () {
                      locator<NavigationService>().clearStackAndShow(Routes.onboardingView3);
                    },
                    color: kcPrimaryColor,
                    boldText: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

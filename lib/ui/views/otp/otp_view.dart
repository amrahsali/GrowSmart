import 'package:growsmart/ui/common/app_colors.dart';
import 'package:growsmart/ui/common/ui_helpers.dart';
import 'package:growsmart/ui/components/submit_button.dart';
import 'package:growsmart/ui/components/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'otp_viewmodel.dart';

class OtpView extends StackedView<OtpViewModel> {
  final String email;

  const OtpView({
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: kcBlackColor,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpaceLarge,
                        const Text(
                          "Enter OTP",
                          style: TextStyle(
                              fontSize: 25,
                          ),
                        ),
                        verticalSpaceMedium,
                        const Text(
                          "We’ve sent an OTP code to your email,",
                          style: TextStyle(fontSize: 14),
                        ),
                        const Text(
                          "User53684@gmail.com",
                          style: TextStyle(fontSize: 14),
                        ),
                        verticalSpaceMedium,
                        TextFieldWidget(
                            hint: "Enter Code", controller: viewModel.otp),
                        verticalSpaceMedium,

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              const Text(
                                "We will resend the code in",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {

                                },
                                child: const Text(
                                  "59 s",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kcSecondaryColor,
                                  ),
                                ),
                              )

                            ]
                        ),
                        verticalSpaceMedium,
                        SubmitButton(
                          isLoading: viewModel.isBusy,
                          label: "Verify",
                          submit: () => viewModel.verify(email, context),
                          boldText: true,
                          color: kcPrimaryColor,
                        ),
                        verticalSpaceMedium,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              const Text(
                                "Remembered password?",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {

                                },
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: kcSecondaryColor,
                                  ),
                                ),
                              )

                            ]
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();
}

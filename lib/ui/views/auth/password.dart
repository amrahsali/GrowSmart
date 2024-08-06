import 'package:growsmart/core/data/models/country.dart';
import 'package:growsmart/ui/common/app_colors.dart';
import 'package:growsmart/ui/components/submit_button.dart';
import 'package:growsmart/ui/components/text_field_widget.dart';
import 'package:growsmart/ui/views/auth/auth_viewmodel.dart';
import 'package:growsmart/utils/country_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';
import '../../common/ui_helpers.dart';
import '../otp/otp_view.dart';

/// @author Amrah sali
/// email: saliamrah300@gmail.com
/// jul, 2024
///

class Password extends StatefulWidget {
  // final TabController controller;
  final Function(bool) updateIsLogin;
  const Password({Key? key, required this.updateIsLogin}) : super(key: key);

  @override
  State<Password> createState() => _RegisterState();
}

class _RegisterState extends State<Password> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: ViewModelBuilder<AuthViewModel>.reactive(
          onViewModelReady: (model) {
            model.init();
          },
          viewModelBuilder: () => AuthViewModel(),
          builder: (context, model, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Center(
                  child: const Text(
                    "Set Password",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                verticalSpaceTiny,

                verticalSpaceMedium,
                TextFieldWidget(
                  hint: " New Password",
                  controller: model.password,
                  obscureText: model.obscure,
                  suffix: InkWell(
                    onTap: () {
                      model.toggleObscure();
                    },
                    child: Icon(
                        model.obscure ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                verticalSpaceMedium,
                TextFieldWidget(
                  hint: "Confirm Password",
                  controller: model.password,
                  obscureText: model.obscure,
                  suffix: InkWell(
                    onTap: () {
                      model.toggleObscure();
                    },
                    child: Icon(
                        model.obscure ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                verticalSpaceTiny,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     InkWell(
                //       onTap: model.toggleRemember,
                //       child: Row(
                //         children: [
                //           Container(
                //               height: 20,
                //               width: 20,
                //               decoration: BoxDecoration(
                //                   color: model.remember
                //                       ? kcSecondaryColor
                //                       : Colors.transparent,
                //                   borderRadius: BorderRadius.circular(5),
                //                   border: Border.all(
                //                       color: model.remember
                //                           ? Colors.transparent
                //                           : kcSecondaryColor)),
                //               child: model.remember
                //                   ? const Center(
                //                 child: Icon(
                //                   Icons.check,
                //                   color: kcWhiteColor,
                //                   size: 14,
                //                 ),
                //               )
                //                   : const SizedBox()),
                //           horizontalSpaceSmall,
                //           const Text(
                //             "Remember Me",
                //             style: TextStyle(
                //                 fontSize: 14, decoration: TextDecoration.underline),
                //           )
                //         ],
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         locator<NavigationService>()
                //             .navigateToChangePasswordView(isResetPassword: true);
                //       },
                //       child: const Text(
                //         "Forgot password?",
                //         style: TextStyle(
                //           fontSize: 16,
                //           color: kcSecondaryColor,
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                verticalSpaceMedium,
                SubmitButton(
                  isLoading: model.isBusy,
                  boldText: true,
                  label: "Continue",
                  submit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpView(email: '',)),
                    );
                  },
                  color: kcPrimaryColor,
                ),
                verticalSpaceMedium,

                Row(
                    children:  [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        //  gotoRegister();

                        },
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 12,
                            color: kcPrimaryColor,
                          ),
                        ),
                      )

                    ]
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),


                verticalSpaceLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }

}

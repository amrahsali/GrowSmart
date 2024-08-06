
import 'package:growsmart/ui/common/app_colors.dart';
import 'package:growsmart/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:growsmart/ui/components/submit_button.dart';



/// @author Amrah sali
/// email: saliamrah@gmail.com
/// jul, 2024
///


class SuccessPage extends StatefulWidget {
  final String title;
  final String description;
  //final Function callback;

  const SuccessPage({
    required this.title,
    required this.description,
    //required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/sucess.png",
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kcBlackColor),
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: kcBlackColor,
                  ),
                ),
              ),
              verticalSpaceMedium,
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(kcWhiteColor)),
                onPressed: () {
                  //widget.callback();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SubmitButton(
                    isLoading: false,
                    label: "Continue",
                    submit: () {
                      {
                        // locator<NavigationService>().clearStackAndShow(Routes.CardView);
                      }

                    },
                    color: kcPrimaryColor,
                    boldText: true,
                  ),
                ),
              )
            ],
          ))
    );
  }
}

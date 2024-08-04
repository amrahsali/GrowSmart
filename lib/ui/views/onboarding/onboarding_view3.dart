import 'package:flutter/material.dart';
import 'package:growsmart/ui/common/app_colors.dart';
import 'package:growsmart/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../components/submit_button.dart';
import '../auth/login.dart';


class OnboardingView3 extends StatefulWidget {
  @override
  State<OnboardingView3> createState() => _OnboardingView3State();
}

class _OnboardingView3State extends State<OnboardingView3> {
  bool _isNotificationOn = false;
  bool _isAppUsageDataOn = false;
  bool _isPromotionalEmailsOn = false;
  bool _isTrackActivitiesOn = false;
  bool _isShareLocationOn = false;
  bool _isVoiceControlOn = false;

  void resetSwitchesExcept(String switchName) {
    setState(() {
      _isNotificationOn = switchName == 'notification';
      _isAppUsageDataOn = switchName == 'appUsageData';
      _isPromotionalEmailsOn = switchName == 'promotionalEmails';
      _isTrackActivitiesOn = switchName == 'trackActivities';
      _isShareLocationOn = switchName == 'shareLocation';
      _isVoiceControlOn = switchName == 'voiceControl';
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage your Privacy',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            verticalSpaceLarge,
            Text(
              'You can change your privacy choices at any time in your settings. For more information, check out the GrowSmart  privacy policy.',
              style: TextStyle(color: kcBlackColor, fontSize: 14),
            ),
            verticalSpaceLarge,
            _buildSwitchRow(
              'Push Notification',
              _isNotificationOn,
              'notification',
            ),
            _buildSwitchRow(
              'App Usage Data',
              _isAppUsageDataOn,
              'appUsageData',
            ),
            _buildSwitchRow(
              'Promotional Emails',
              _isPromotionalEmailsOn,
              'promotionalEmails',
            ),
            _buildSwitchRow(
              'Track Activities',
              _isTrackActivitiesOn,
              'trackActivities',
            ),
            _buildSwitchRow(
              'Share My Location',
              _isShareLocationOn,
              'shareLocation',
            ),
            _buildSwitchRow(
              'Voice Control',
              _isVoiceControlOn,
              'voiceControl',
            ),
            verticalSpaceLarge,
            Center(
              child: SubmitButton(
                isLoading: false,
                label: "Next",
                submit: () {
                  locator<NavigationService>().clearStackAndShow(Routes.authView);
                },
                color: kcPrimaryColor,
                boldText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSwitchRow(String label, bool value, String switchName) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: value,
          onChanged: (bool newValue) {
            //resetSwitchesExcept(switchName);
          },
          activeColor: kcPrimaryColor,
          //inactiveThumbColor: kcSecondaryColor,
        ),
      ],
    ),
  );
}

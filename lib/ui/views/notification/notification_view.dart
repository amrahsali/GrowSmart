import 'package:growsmart/core/data/models/app_notification.dart';
import 'package:growsmart/state.dart';
import 'package:growsmart/ui/common/ui_helpers.dart';
import 'package:growsmart/ui/components/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:growsmart/ui/views/notification/payment.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../components/submit_button.dart';
import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Reminders",
        ),
      ),
      body: ValueListenableBuilder<List<AppNotification>>(
        valueListenable: notifications,
        builder: (context, value, child) =>
        value.isEmpty
            ? RefreshIndicator(
                onRefresh: () async {
                  viewModel.getNotifications();
                },
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/reminder.png', // Replace with your image path
                              height: 150, // Set the desired height
                            ),
                            const SizedBox(height: 20), // Add some spacing
                            const Text(
                              "Oops! Nothing to see here yet.",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            verticalSpaceLarge,
                            const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Center(
                                child: Text(
                                  'Subscribe to GrowSmart pro to receive friendly daily medical advice.',
                                  style: TextStyle(
                                      color: kcBlackColor, fontSize: 14),
                                ),
                              ),
                            ),
                            SubmitButton(
                              isLoading: false,
                              label: "GO PREMIUM",
                              submit: () {
                                //locator<NavigationService>().clearStackAndShow(Routes.onboardingView3);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Payment()),
                                );
                              },
                              color: kcPrimaryColor,
                              boldText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            :
        ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: value.length,
                itemBuilder: (context, index) {
                  AppNotification notification = value[index];
                  return Card(
                    child: ListTile(
                      onTap: () => viewModel.readNotification(notification),
                      title: Row(
                        children: [
                          Text(
                            "wert",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                           "werty",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      trailing: Text(DateFormat("d MMM y")
                          .format(DateTime.parse(notification.created!))),
                    ),
                  );
                }),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}

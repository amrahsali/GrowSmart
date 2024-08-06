import 'package:flutter/material.dart';
import 'package:growsmart/ui/views/notification/payment_method.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../common/app_colors.dart';
import '../../components/submit_button.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController feedbackController = TextEditingController();

  // List of payment methods with their names and image paths
  final List<Map<String, String>> paymentMethods = [
    {'name': 'Mastercard', 'image': 'assets/images/Mastercard.png'},
    {'name': 'Visa', 'image': 'assets/images/visa.png'},
    {'name': 'Payoneer', 'image': 'assets/images/Payoneer.png'},
    {'name': 'Gpay', 'image': 'assets/images/google.png'},
    {'name': 'Paypal', 'image': 'assets/images/paypal.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Reminder",
          style: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          Text('Select Payment Method'),
          Expanded(
            child: ListView.builder(
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final paymentMethod = paymentMethods[index];
                return GestureDetector(
                  // onTap: () => _onPaymentMethodSelected(context, paymentMethod['name']!),
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            paymentMethod['name']!,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Image.asset(
                            paymentMethod['image']!,
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
                        builder: (context) => CardView()),
                  );
                }
                ;
              },
              color: kcPrimaryColor,
              boldText: true,
            ),
          ),
        ],
      ),
    );
  }
}

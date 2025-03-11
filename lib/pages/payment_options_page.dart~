import 'package:flutter/material.dart';
import '../routes.dart';
import '../utils/constants.dart';
import '../widgets/custom_button.dart';

class PaymentOptionsPage extends StatefulWidget {
  const PaymentOptionsPage({Key? key}) : super(key: key);

  @override
  _PaymentOptionsPageState createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  String? selectedPaymentMethod;

  final List<Map<String, dynamic>> _paymentMethods = [
    {"name": "Visa", "icon": "assets/icons/visacard.png"},
    {"name": "MasterCard", "icon": "assets/icons/mastercard.png"},
    {"name": "PayPal", "icon": Icons.payment},
  ];

  /// ✅ Confirm Payment Before Proceeding
  void _confirmPayment() {
    if (selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a payment method")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Payment"),
        content: Text("You selected $selectedPaymentMethod. Proceed to payment?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          CustomButton(
            text: "Confirm",
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.bookingConfirmation);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Options")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: _paymentMethods.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final method = _paymentMethods[index];
                  return ListTile(
                    leading: method["icon"] is String
                        ? Image.asset(method["icon"], width: 40)
                        : Icon(method["icon"], size: 40, color: Theme.of(context).colorScheme.primary),
                    title: Text(method["name"], style: Theme.of(context).textTheme.bodyLarge),
                    trailing: Radio<String>(
                      value: method["name"],
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        selectedPaymentMethod = method["name"];
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Proceed to Payment",
              onPressed: _confirmPayment,
            ),
          ],
        ),
      ),
    );
  }
}

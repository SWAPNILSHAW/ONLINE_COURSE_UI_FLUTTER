import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  Methods _paymentMethod = Methods.netBanking;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<Methods>(
          value: Methods.netBanking,
          groupValue: _paymentMethod,
          onChanged: (Methods? value) {
            setState(() {
              _paymentMethod = value!;
            });
          },
          title: const Text('Net Banking'),
        ),
        RadioListTile<Methods>(
          value: Methods.cards,
          groupValue: _paymentMethod,
          onChanged: (Methods? value) {
            setState(() {
              _paymentMethod = value!;
            });
          },
          title: const Text('Credit/Debit Card'),
        ),
      ],
    );
  }
}

enum Methods { netBanking, cards }

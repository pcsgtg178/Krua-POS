import 'package:flutter/material.dart';
import 'package:krua_pos/models/receipt.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.receipt});

  final Receipt receipt;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Container(
        child: ListView.builder(
          itemCount: receipt.itemList.length,
          itemBuilder: (context, index) {
            final item = receipt.itemList[index];
            return Text(item,
                style: const TextStyle(fontSize: 14, color: Colors.black));
          },
        ),
      ),
    );
  }
}

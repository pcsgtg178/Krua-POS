import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krua_pos/models/receipt.dart';
import 'package:krua_pos/screens/sale_screen/bloc/sale_bloc.dart';
import 'package:provider/provider.dart';

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

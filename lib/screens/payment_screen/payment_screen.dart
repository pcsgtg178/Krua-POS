import 'package:flutter/material.dart';
import 'package:krua_pos/screens/sale_screen/bloc/sale_bloc.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final receipt = context.watch<SaleBloc>().state.receipt;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment')
      ),
      body: Center(
        child: Container(
          child: Text('$receipt'),
        ),
      ),
    );
  }
}
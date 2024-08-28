import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:krua_pos/screens/sale_screen/bloc/sale_bloc.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController barcodeCtrl = TextEditingController();

    return BlocProvider(
      create: (context) => SaleBloc()..add(SaleReady()),
      child: BlocBuilder<SaleBloc, SaleState>(
        builder: (context, state) {

          final receipt = state.receipt;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Sale Page'),
            ),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: receipt.itemList.length,
                        itemBuilder: (context, index) {
                          String itemName = receipt.itemList[index];
                          return Text(itemName, style: const TextStyle(fontSize: 14, color: Colors.black));
                        },
                      ),
                    )
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Column(
                      children: [
                        TextField(
                          controller: barcodeCtrl,
                          decoration: const InputDecoration(
                            label: Text('Barcode'),
                            hintText: 'Please enter barcode.'
                          ),
                        ),
                        ElevatedButton(onPressed: () {
                          context.read<SaleBloc>().add(ItemAdded(barcodeCtrl.text));
                        }, child: const Text('Add Item')),
                        ElevatedButton(onPressed: () {
                          context.go('/sale/payment', extra: receipt);
                        }, child: const Text('Go to Payment'))
                      ],
                    ),
                  )
                ]
              )
            ),
          );
        },
      ),
    );
  }
}
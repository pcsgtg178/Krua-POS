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
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle
                            ),
                            child: Text(itemName, style: const TextStyle(fontSize: 14))
                          );
                        },
                      ),
                    )
                  ),
                  SizedBox(
                    width: 300.0,
                    child: Column(
                      children: [
                        
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
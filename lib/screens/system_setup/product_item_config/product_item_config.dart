import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krua_pos/screens/layouts/app_sidebar.dart';

import 'bloc/product_item_config_bloc.dart';

class ProductItemConfig extends StatelessWidget {
  const ProductItemConfig({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ProductItemConfigBloc(),
      child: Scaffold(
        drawer: AppSidebar(),
        appBar: AppBar(
          title: const Text('Product Item Configuration'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Preview Card item
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text(
                      //   'Product Item Preview',
                      //   style: Theme.of(context).textTheme.headline6,
                      // ),
                      // const SizedBox(height: 10),
                      // Text(
                      //   'This is a preview of the product item configuration.',
                      //   style: Theme.of(context).textTheme.bodyText2,
                      // ),
                    ],
                  ),
                ),
              ),
      
              ElevatedButton(
                onPressed: () {
                  // Add your button action here
                },
                child: const Text('Configure Product Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
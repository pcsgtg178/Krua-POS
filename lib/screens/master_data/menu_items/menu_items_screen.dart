import 'package:flutter/material.dart';
import 'package:krua_pos/screens/layouts/app_sidebar.dart';
import 'package:krua_pos/widgets/my_table.dart';

class ProductDataScreen extends StatelessWidget {
  const ProductDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppSidebar(),
      appBar: AppBar(
        title: const Text('Product Data'),
      ),
      body: MyTable(
        columns: [
          {'label': 'Column 1'},
          {'label': 'Column 2'},
        ],
        tableBody: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('สินค้า A'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('100'),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('สินค้า B'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('150'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
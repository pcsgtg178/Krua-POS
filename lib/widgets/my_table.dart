import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  final List<Map<String, String>> columns;
  final List<TableRow>? tableBody;

  const MyTable({Key? key, required this.columns, this.tableBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        for (var i = 0; i < columns.length; i++) i: const FlexColumnWidth(),
      },
      children: [
        // Header row
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: columns
            .map((col) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    col['label'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
            .toList(),
        ),
        // Table Body
         // Table Body from slot
        if (tableBody != null)
          ...tableBody!
        else
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'No data found',
                  textAlign: TextAlign.center,
                ),
              ),
              for (int i = 1; i < columns.length; i++) const SizedBox.shrink(),
            ],
          ),
      ],
    );
  }
}
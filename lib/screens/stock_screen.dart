import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estoque',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Lógica para lidar com o botão de "Entrada"
                },
                child: Text('Entrada'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // Lógica para lidar com o botão de "Saída"
                },
                child: Text('Saída'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Itens que entraram:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Item')),
              DataColumn(label: Text('Quantidade')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Item 1')),
                DataCell(Text('10')),
              ]),
              DataRow(cells: [
                DataCell(Text('Item 2')),
                DataCell(Text('5')),
              ]),
              DataRow(cells: [
                DataCell(Text('Item 3')),
                DataCell(Text('3')),
              ]),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Itens que saíram:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Item')),
              DataColumn(label: Text('Quantidade')),
              DataColumn(label: Text('Valor')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Item A')),
                DataCell(Text('2')),
                DataCell(Text('25')),
              ]),
              DataRow(cells: [
                DataCell(Text('Item B')),
                DataCell(Text('4')),
                DataCell(Text('25')),
              ]),
              DataRow(cells: [
                DataCell(Text('Item C')),
                DataCell(Text('1')),
                DataCell(Text('25')),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConectVisão',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    IndicatorsScreen(),
    DataScreen(),
    StockScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConectVisão'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Indicadores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Dados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Estoque',
          ),
        ],
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Venda do Dia',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 70,
                    color: Colors.green,
                  ),
                  GaugeRange(
                    startValue: 70,
                    endValue: 100,
                    color: Colors.grey,
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Text(
                      'Vendas do Dia: 350',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.5,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Gráfico de Vendas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                ColumnSeries<ChartData, String>(
                  dataSource: [
                    ChartData('Jan', 30),
                    ChartData('Fev', 40),
                    ChartData('Mar', 50),
                    ChartData('Abr', 45),
                    ChartData('Mai', 55),
                    ChartData('Jun', 60),
                  ],
                  xValueMapper: (ChartData data, _) => data.month,
                  yValueMapper: (ChartData data, _) => data.value,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IndicatorsScreen extends StatefulWidget {
  @override
  _IndicatorsScreenState createState() => _IndicatorsScreenState();
}

class _IndicatorsScreenState extends State<IndicatorsScreen> {
  String _selectedFilter = 'Dia';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Indicadores',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterButton(
                text: 'Dia',
                isSelected: _selectedFilter == 'Dia',
                onPressed: () {
                  setState(() {
                    _selectedFilter = 'Dia';
                  });
                },
              ),
              SizedBox(width: 16),
              FilterButton(
                text: 'Mês',
                isSelected: _selectedFilter == 'Mês',
                onPressed: () {
                  setState(() {
                    _selectedFilter = 'Mês';
                  });
                },
              ),
              SizedBox(width: 16),
              FilterButton(
                text: 'Ano',
                isSelected: _selectedFilter == 'Ano',
                onPressed: () {
                  setState(() {
                    _selectedFilter = 'Ano';
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Filtro selecionado: $_selectedFilter',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Text(
            'Gráfico de Indicadores',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                LineSeries<ChartData, String>(
                  dataSource: [
                    ChartData('Jan', 70),
                    ChartData('Fev', 60),
                    ChartData('Mar', 50),
                    ChartData('Abr', 55),
                    ChartData('Mai', 65),
                    ChartData('Jun', 75),
                  ],
                  xValueMapper: (ChartData data, _) => data.month,
                  yValueMapper: (ChartData data, _) => data.value,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String _selectedFilter = 'Dia';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dados',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterButton(
                text: 'Dia',
                isSelected: _selectedFilter == 'Dia',
                onPressed: () {
                  setState(() {
                    _selectedFilter = 'Dia';
                  });
                },
              ),
              SizedBox(width: 16),
              FilterButton(
                text: 'Mês',
                isSelected: _selectedFilter == 'Mês',
                onPressed: () {
                  setState(() {
                    _selectedFilter = 'Mês';
                  });
                },
              ),
              SizedBox(width: 16),
              FilterButton(
                text: 'Ano',
                isSelected: _selectedFilter == 'Ano',
                onPressed: () {
                  setState(() {
                    _selectedFilter = 'Ano';
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Filtro selecionado: $_selectedFilter',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Text(
            'Gráfico de Dados',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                ColumnSeries<ChartData, String>(
                  dataSource: [
                    ChartData('Jan', 100),
                    ChartData('Fev', 150),
                    ChartData('Mar', 200),
                    ChartData('Abr', 175),
                    ChartData('Mai', 250),
                    ChartData('Jun', 300),
                  ],
                  xValueMapper: (ChartData data, _) => data.month,
                  yValueMapper: (ChartData data, _) => data.value,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.blue : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

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
                DataCell(Text('15')),
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
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Item 1')),
                DataCell(Text('8')),
              ]),
              DataRow(cells: [
                DataCell(Text('Item 2')),
                DataCell(Text('3')),
              ]),
              DataRow(cells: [
                DataCell(Text('Item 3')),
                DataCell(Text('6')),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String month;
  final double value;

  ChartData(this.month, this.value);
}

import 'package:flutter/material.dart';

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

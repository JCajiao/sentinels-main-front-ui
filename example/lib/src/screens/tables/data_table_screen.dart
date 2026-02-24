import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class DataTableScreen extends StatelessWidget {
  const DataTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Data Tables',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsDataTable(
          title: 'Employees Roster',
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Position')),
            DataColumn(label: Text('Office')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Start Date')),
            DataColumn(label: Text('Salary')),
          ],
          source: _EmployeeDataSource(),
          rowsPerPage: 10,
        ),
      ],
    );
  }
}

class _EmployeeDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(50, (index) {
    return {
      'name': 'Employee \$index',
      'position': ['Developer', 'Designer', 'Manager', 'QA'][index % 4],
      'office': ['London', 'New York', 'Tokyo', 'San Francisco'][index % 4],
      'age': 20 + (index % 30),
      'date': '2023-01-\${(index % 28) + 1}',
      'salary': '\$\${50000 + (index * 1000)}',
    };
  });

  @override
  DataRow getRow(int index) {
    if (index >= _data.length) return const DataRow(cells: []);
    final item = _data[index];
    return DataRow(
      cells: [
        DataCell(Text(item['name'])),
        DataCell(Text(item['position'])),
        DataCell(Text(item['office'])),
        DataCell(Text(item['age'].toString())),
        DataCell(Text(item['date'])),
        DataCell(Text(item['salary'])),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

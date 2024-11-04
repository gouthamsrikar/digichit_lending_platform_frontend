import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalaryExpenseBarChart extends StatelessWidget {
  final List<SalaryExpenseData> data;

  SalaryExpenseBarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: 'Months'),
      ),
      primaryYAxis: NumericAxis(),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries>[
        ColumnSeries<SalaryExpenseData, String>(
          name: 'Total Credit',
          dataSource: data,
          xValueMapper: (SalaryExpenseData item, _) => item.month,
          yValueMapper: (SalaryExpenseData item, _) => item.salary,
          color: Color(0xFF14B1C8),
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
        ColumnSeries<SalaryExpenseData, String>(
          name: 'Total Debit',
          dataSource: data,
          xValueMapper: (SalaryExpenseData item, _) => item.month,
          yValueMapper: (SalaryExpenseData item, _) => item.expense,
          color: Color(0xFF1468C8),
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class SalaryExpenseData {
  final String month;
  final double salary;
  final double expense;

  SalaryExpenseData(this.month, this.salary, this.expense);
}

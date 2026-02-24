import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class ApexScreen extends StatelessWidget {
  const ApexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Charts',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 992;

            final Widget barChartCard = SentinelsCard(
              title: 'Monthly Revenue (Bar Chart)',
              child: SizedBox(
                height: 300,
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(
                            toY: 8,
                            color: Theme.of(context).primaryColor,
                            width: 16)
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(
                            toY: 10,
                            color: Theme.of(context).primaryColor,
                            width: 16)
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(
                            toY: 14,
                            color: Theme.of(context).primaryColor,
                            width: 16)
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(
                            toY: 15,
                            color: Theme.of(context).primaryColor,
                            width: 16)
                      ]),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(
                            toY: 13,
                            color: Theme.of(context).primaryColor,
                            width: 16)
                      ]),
                      BarChartGroupData(x: 5, barRods: [
                        BarChartRodData(
                            toY: 10,
                            color: Theme.of(context).primaryColor,
                            width: 16)
                      ]),
                    ],
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            );

            final Widget radarChartCard = SentinelsCard(
              title: 'Performance (Radar Chart)',
              child: SizedBox(
                height: 300,
                child: RadarChart(
                  RadarChartData(
                    dataSets: [
                      RadarDataSet(
                        dataEntries: const [
                          RadarEntry(value: 80),
                          RadarEntry(value: 90),
                          RadarEntry(value: 70),
                          RadarEntry(value: 85),
                          RadarEntry(value: 95),
                        ],
                        fillColor: Theme.of(context)
                            .primaryColor
                            .withValues(alpha: 0.3),
                        borderColor: Theme.of(context).primaryColor,
                      ),
                    ],
                    radarBackgroundColor: Colors.transparent,
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            );

            if (isDesktop) {
              return Row(
                children: [
                  Expanded(child: barChartCard),
                  const SizedBox(width: SentinelsSpacing.xl),
                  Expanded(child: radarChartCard),
                ],
              );
            }

            return Column(
              children: [
                barChartCard,
                const SizedBox(height: SentinelsSpacing.xl),
                radarChartCard,
              ],
            );
          },
        ),
      ],
    );
  }
}

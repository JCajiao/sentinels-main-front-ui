import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        LayoutBuilder(
          builder: (context, constraints) {
            final int crossAxisCount = constraints.maxWidth > 1200
                ? 4
                : constraints.maxWidth > 800
                    ? 2
                    : 1;

            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: SentinelsSpacing.lg,
              mainAxisSpacing: SentinelsSpacing.lg,
              childAspectRatio: 2.5,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                SentinelsStatCard(
                  title: 'Total Revenue',
                  value: '\$45,231.89',
                  icon: Icons.attach_money,
                  trendValue: '+20.1%',
                  isTrendUp: true,
                ),
                SentinelsProgressCard(
                  title: 'Monthly Target',
                  value: '75%',
                  progress: 0.75,
                  subtitle: '\$15,000 to go',
                ),
                SentinelsStatCard(
                  title: 'New Subscriptions',
                  value: '1,200',
                  icon: Icons.card_membership,
                  trendValue: '+19.0%',
                  isTrendUp: true,
                ),
                SentinelsProgressCard(
                  title: 'Server Load',
                  value: '42%',
                  progress: 0.42,
                  subtitle: 'Optimal performance',
                  color: SentinelsColors.success,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 992;

            final Widget lineChartCard = SentinelsCard(
              title: 'Sales Analytics',
              actions: [
                SentinelsChartFilterTabs(
                  tabs: const ['Day', 'Week', 'Month'],
                  onTabChanged: (i) {},
                  initialIndex: 2,
                ),
              ],
              child: SizedBox(
                height: 300,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 3),
                          FlSpot(1, 1),
                          FlSpot(2, 4),
                          FlSpot(3, 2),
                          FlSpot(4, 5),
                          FlSpot(5, 3),
                          FlSpot(6, 4),
                        ],
                        isCurved: true,
                        color: Theme.of(context).primaryColor,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

            final Widget pieChartCard = SentinelsCard(
              title: 'Traffic Sources',
              child: SizedBox(
                height: 300,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                    sections: [
                      PieChartSectionData(
                        color: Theme.of(context).primaryColor,
                        value: 40,
                        title: '40%',
                        radius: 50,
                        titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      PieChartSectionData(
                        color: Theme.of(context).colorScheme.secondary,
                        value: 30,
                        title: '30%',
                        radius: 50,
                        titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      PieChartSectionData(
                        color: SentinelsColors.warning,
                        value: 15,
                        title: '15%',
                        radius: 50,
                        titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      PieChartSectionData(
                        color: SentinelsColors.danger,
                        value: 15,
                        title: '15%',
                        radius: 50,
                        titleStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );

            if (isDesktop) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: lineChartCard),
                  const SizedBox(width: SentinelsSpacing.xl),
                  Expanded(flex: 1, child: pieChartCard),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                lineChartCard,
                const SizedBox(height: SentinelsSpacing.xl),
                pieChartCard,
              ],
            );
          },
        ),
      ],
    );
  }
}

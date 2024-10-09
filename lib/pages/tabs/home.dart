import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
        toolbarHeight: 0,
      ),
      backgroundColor: context.colorScheme.surface,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: Text(
                    DateFormat('E, d MMM yyyy').format(DateTime.now()),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.surface,
                        ),
                  ),
                ),
                const Spacing.large(),
                // Hi, [username]
                Text(
                  'Bonjour, Julien',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: context.colorScheme.surface,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacing.medium(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: context.colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        LucideIcons.star,
                        color: context.colorScheme.onTertiary,
                        size: 20,
                      ),
                    ),
                    const Spacing.small(),
                    Text(
                      'Pro',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: context.colorScheme.surface,
                          ),
                    ),
                    const Spacing.medium(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: context.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        LucideIcons.smile,
                        color: context.colorScheme.onSecondary,
                        size: 20,
                      ),
                    ),
                    const Spacing.small(),
                    Text(
                      'Heureux',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: context.colorScheme.surface,
                          ),
                    ),
                  ],
                ),
                const Spacing.large(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.search,
                        color: context.colorScheme.onSurface,
                        size: 20,
                      ),
                      const Spacing.small(),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Rechercher',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: context.colorScheme.onSurface,
                                ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacing.xlarge(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Mes statistiques',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                ),
              ),
              const Spacing.medium(),
              Container(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    FreudScore(),
                    const Spacing.medium(),
                    Mood(),
                    const Spacing.medium(),
                    FreudScore(),
                    const Spacing.medium(),
                    Mood(),
                  ],
                ),
              )
            ],
          ),
          const Spacing.xlarge(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Suivie de mes addictions',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                      ),
                ),
              ),
              const Spacing.medium(),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const Spacing.medium(),
                  ActivityTile(
                    icon: Icons.local_drink,
                    title: 'Alcool',
                    subtitle: '1 verre',
                    date: 'Hier',
                  ),
                  const Spacing.medium(),
                  ActivityTile(
                    icon: Icons.smoking_rooms,
                    title: 'Cigarette',
                    subtitle: '5 cigarettes',
                    date: 'Il y a 2 jours',
                  ),
                  const Spacing.medium(),
                  ActivityTile(
                    icon: Icons.fastfood,
                    title: 'Fastfood',
                    subtitle: '1 repas',
                    date: 'Il y a 3 jours',
                  ),
                  const Spacing.medium(),
                  ActivityTile(
                    icon: Icons.local_drink,
                    title: 'Alcool',
                    subtitle: '2 verre',
                    date: 'Il y a 4 jours',
                  ),
                ],
              ),
            ],
          ),
          const Spacing.xlarge(),
        ],
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String date;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              icon,
              color: context.colorScheme.primary,
              size: 30,
            ),
          ),
          const Spacing.medium(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: context.colorScheme.primary.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              date,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: context.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class FreudScore extends StatelessWidget {
  const FreudScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      decoration: BoxDecoration(
        color: context.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.favorite,
                color: context.colorScheme.onTertiary,
                size: 20,
              ),
              const Spacing.small(),
              Text(
                'Freud Score',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: context.colorScheme.onTertiary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '80',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: context.colorScheme.onTertiary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Bon',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onTertiary,
                        ),
                  ),
                ],
              ),
              Container(
                height: 156,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 10,
                    centerSpaceRadius: 50,
                    sections: [
                      PieChartSectionData(
                        color: context.colorScheme.onTertiary,
                        value: 20,
                        radius: 12,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        color: context.colorScheme.onTertiary,
                        value: 12,
                        radius: 12,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        color: context.colorScheme.onTertiary,
                        value: 8,
                        radius: 12,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        color: context.colorScheme.onTertiary.withOpacity(0.5),
                        value: 10,
                        radius: 12,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        color: context.colorScheme.onTertiary,
                        value: 15,
                        radius: 12,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Mood extends StatelessWidget {
  const Mood({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                LucideIcons.smile,
                color: context.colorScheme.onSecondary,
                size: 20,
              ),
              const Spacing.small(),
              Text(
                'Mood',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Container(
            height: 156,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10,
                minY: 0,
                groupsSpace: 20,
                titlesData: FlTitlesData(
                  show: false,
                ),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipRoundedRadius: 10,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        rod.toY.round().toString(),
                        TextStyle(
                          color: context.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 5,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 8,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 3,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 5,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        toY: 7,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(
                        toY: 2,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 6,
                    barRods: [
                      BarChartRodData(
                        toY: 4,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 7,
                    barRods: [
                      BarChartRodData(
                        toY: 6,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 8,
                    barRods: [
                      BarChartRodData(
                        toY: 9,
                        color: context.colorScheme.onSecondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

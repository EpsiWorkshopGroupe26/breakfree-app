import 'dart:math';

import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserProfilView extends StatelessWidget {
  const UserProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 30, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profil',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: context.colorScheme.onPrimary,
                              ),
                    ),
                    const Spacing.large(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: context.colorScheme.secondary,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage('https://i.pravatar.cc/150'),
                          ),
                        ),
                        const Spacing.medium(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Julien Mercier',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: context.colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'julien.mercier@gmail.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: context.colorScheme.onPrimary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  const Spacing.large(),
                  AddictionCard(
                    icon: Icons.smoking_rooms,
                    title: 'Tabac',
                    subtitle: 'Fumeur depuis 5 ans',
                    stop: false,
                  ),
                  const Spacing.medium(),
                  AddictionCard(
                    icon: Icons.local_drink,
                    title: 'Alcool',
                    subtitle: 'Consommation régulière',
                    stop: false,
                  ),
                  const Spacing.medium(),
                  AddictionCard(
                    icon: Icons.fastfood,
                    title: 'Malbouffe',
                    subtitle: 'Consommation régulière',
                    stop: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddictionCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool stop;

  const AddictionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.stop,
  });

  @override
  State<AddictionCard> createState() => _AddictionCardState();
}

class _AddictionCardState extends State<AddictionCard> {
  List<BarChartGroupData> generateRandomBarChartData() {
    final Random random = Random();
    return List.generate(20, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: random.nextInt(10).toDouble(),
            color: context.colorScheme.primary,
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  widget.icon,
                  color: context.colorScheme.primary,
                  size: 30,
                ),
              ),
              const Spacing.medium(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.subtitle,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.primary.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: widget.stop
                      ? context.colorScheme.primary
                      : context.colorScheme.error,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  widget.stop ? 'Arrêter' : 'En cours',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: context.colorScheme.surface,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          // Random bar chart
          Container(
            height: 100,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10,
                minY: 0,
                groupsSpace: 20,
                titlesData: FlTitlesData(
                  show: false,
                ),
                gridData: FlGridData(
                  show: false,
                ),
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: generateRandomBarChartData(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

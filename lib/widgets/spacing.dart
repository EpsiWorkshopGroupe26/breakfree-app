import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double size;

  const Spacing.xsmall({super.key}) : size = 4.0;
  const Spacing.small({super.key}) : size = 8.0;
  const Spacing.medium({super.key}) : size = 16.0;
  const Spacing.large({super.key}) : size = 24.0;
  const Spacing.xlarge({super.key}) : size = 32.0;
  const Spacing.expanded({super.key}) : size = double.infinity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size, width: size);
  }
}

import 'package:breakfree/helpers/validators.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:breakfree/widgets/text_field.dart';

import 'package:flutter/material.dart';

class NameSetupView extends StatelessWidget {
  final GlobalKey<FormState> nameFormKey;
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;

  const NameSetupView({
    super.key,
    required this.nameFormKey,
    required this.firstnameController,
    required this.lastnameController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comment t’appelle tu ?',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacing.large(),
              Form(
                key: nameFormKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: BreakfreeTextField(
                        title: 'Prénom',
                        controller: firstnameController,
                        textInputAction: TextInputAction.next,
                        validator: (String? value) => Validators.nameValidator(
                            value ?? '',
                            isRequired: true),
                      ),
                    ),
                    const Spacing.small(),
                    Expanded(
                      child: BreakfreeTextField(
                        title: 'Nom',
                        controller: lastnameController,
                        textInputAction: TextInputAction.done,
                        validator: (String? value) => Validators.nameValidator(
                            value ?? '',
                            isRequired: true),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/models/addiction_model.dart';
import 'package:breakfree/pages/auth/login_view.dart';
import 'package:breakfree/pages/auth/setup/addiction_setup_view.dart';
import 'package:breakfree/pages/auth/setup/age_setup_view.dart';
import 'package:breakfree/pages/auth/setup/depression_setup_view.dart';
import 'package:breakfree/pages/auth/setup/gender_setup_view.dart';
import 'package:breakfree/pages/auth/setup/mental_health_setup_view.dart';
import 'package:breakfree/pages/auth/setup/name_setup_view.dart';
import 'package:breakfree/pages/auth/setup/professional_status_setup_view.dart';
import 'package:breakfree/pages/auth/setup/stress_setup_view.dart';
import 'package:breakfree/utils/enums/emotional_status_enum.dart';
import 'package:breakfree/utils/enums/gender_enum.dart';
import 'package:breakfree/utils/enums/professional_status_enum.dart';
import 'package:breakfree/widgets/appbar.dart';
import 'package:breakfree/widgets/button.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class SetupView extends StatefulWidget {
  const SetupView({Key? key}) : super(key: key);

  @override
  _SetupViewState createState() => _SetupViewState();
}

class _SetupViewState extends State<SetupView> {
  late PageController _pageController = PageController();

  // USER
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  Gender? _selectedGender;
  ProfessionalStatusEnum? _professionalStatus;

  // ADDICTION QUESTIONS
  List<AddictionModel> _addictions = [];

  // MENTAL WELLBEING QUESTIONS
  EmotionalStatusEnum? _emotionalStatus;
  bool _symptomesDepression = false;
  int _stressLevel = 5;

  // MOTIVATION ET SUPPORT QUESTIONS
  String? _motivationChanger;
  String? _supportSocial;
  String? _consultationProfessionnelle;

  // FINAL QUESTIONS
  String? _objectifs;

  // Form Keys
  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _birthdayFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _ageFormKey = GlobalKey<FormState>();

  int currentView = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> userPages = [
      NameSetupView(
        nameFormKey: _nameFormKey,
        firstnameController: _firstnameController,
        lastnameController: _lastnameController,
      ),
      AgeSetupView(
        ageFormKey: _ageFormKey,
        ageController: _ageController,
      ),
      GenderSetupView(
        onSelectedGenderChanged: (Gender gender) {
          setState(() {
            _selectedGender = gender;
          });
        },
      ),
      ProfessionalStatusSetupView(
        onSelectedProfessionalStatusChanged:
            (ProfessionalStatusEnum professionalStatus) {
          setState(() {
            _professionalStatus = professionalStatus;
          });
        },
      ),
      AddictionSetupView(
        onAddictionAdded: (AddictionModel addiction) {
          setState(() {
            _addictions.add(addiction);
          });
        },
      ),
      EmotionalStatusSetupView(
        onEmotionalStatusChanged: (EmotionalStatusEnum emotionalStatus) {
          setState(() {
            _emotionalStatus = emotionalStatus;
          });
        },
      ),
      DepressionSetupView(
        onSymptomesDepressionChanged: (bool symptomesDepression) {
          setState(() {
            _symptomesDepression = symptomesDepression;
          });
        },
      ),
      StressLevelSetupView(
        onStressLevelChanged: (int stressLevel) {
          setState(() {
            _stressLevel = stressLevel;
          });
        },
      ),
      // MotivationChangerSetupView(
      //   motivationChangerFormKey: _motivationChangerFormKey,
      //   motivationChanger: _motivationChanger,
      // ),
      // SupportSocialSetupView(
      //   supportSocialFormKey: _supportSocialFormKey,
      //   supportSocial: _supportSocial,
      // ),
      // ConsultationProfessionnelleSetupView(
      //   consultationProfessionnelleFormKey: _consultationProfessionnelleFormKey,
      //   consultationProfessionnelle: _consultationProfessionnelle,
      // ),
      // ObjectifsSetupView(
      //   objectifsFormKey: _objectifsFormKey,
      //   objectifs: _objectifs,
      // ),
    ];

    return Scaffold(
      appBar: BreakfreeAppBar(
        title: '',
        showBackButton: false,
        leading: IconButton(
          icon: Icon(
            LucideIcons.arrow_left,
            color: context.colorScheme.onSurface,
            weight: 10,
            size: 26,
          ),
          onPressed: () {
            if (_pageController.page == 0) {
              Navigator.pop(context);
            } else {
              FocusScope.of(context).unfocus();
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: (currentView) / userPages.length,
                  backgroundColor: context.colorScheme.surfaceContainer,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.colorScheme.primary,
                  ),
                  strokeWidth: 2.5,
                ),
                Text(
                  '${((currentView) / userPages.length * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // // Progress Bar
          // LinearProgressIndicator(
          //   value: (currentView + 1) / userPages.length,
          //   backgroundColor: context.colorScheme.surfaceContainer,
          //   valueColor: AlwaysStoppedAnimation<Color>(
          //     context.colorScheme.primary,
          //   ),
          // ),
          // const Spacing.large(),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentView = index;
                });
              },
              children: userPages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: BreakfreeButton(
              label:
                  currentView == userPages.length - 1 ? 'Terminer' : 'Suivant',
              onPressed: () async {
                FocusScope.of(context).unfocus();
                switch (currentView) {
                  case 0:
                    if (_nameFormKey.currentState!.validate()) {
                      nextPage();
                    }
                    break;
                  case 1:
                    if (_ageFormKey.currentState!.validate()) {
                      nextPage();
                    }
                    break;
                  case 2:
                    if (_selectedGender != null) {
                      nextPage();
                    }
                    break;
                  case 3:
                    if (_professionalStatus != null) {
                      nextPage();
                    }
                    break;
                  case 4:
                    if (_addictions.isNotEmpty) {
                      nextPage();
                    }
                    break;
                  case 5:
                    if (_emotionalStatus != null) {
                      nextPage();
                    }
                    break;
                  case 6:
                    nextPage();
                    break;
                  case 7:
                    nextPage();
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

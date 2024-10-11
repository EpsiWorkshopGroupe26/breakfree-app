import 'package:breakfree/configs/themes/app_theme.dart';
import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/helpers/validators.dart';
import 'package:breakfree/models/addiction_model.dart';
import 'package:breakfree/models/user_model.dart';
import 'package:breakfree/pages/Credentials.dart';
import 'package:breakfree/pages/auth/setup/setup_view.dart';
import 'package:breakfree/utils/services/auth_service.dart';
import 'package:breakfree/widgets/appbar.dart';
import 'package:breakfree/widgets/button.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:breakfree/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BreakfreeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Inscription',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const Spacing.small(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'Veuillez renseigner les informations suivantes',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: context.colorScheme.outline),
                      ),
                    ),
                    const Spacing.xlarge(),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          BreakfreeTextField(
                            controller: _emailController,
                            hintText: 'Email',
                            autoFocus: true,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (String? value) {
                              return Validators.emailValidator(value!);
                            },
                          ),
                          const Spacing.medium(),
                          BreakfreeTextField(
                            controller: _passwordController,
                            hintText: 'Mot de passe',
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            showPassword: true,
                            validator: (String? value) {
                              return Validators.passwordValidator(value!);
                            },
                          ),
                          const Spacing.small(),
                          BreakfreeTextField(
                            controller: _confirmPasswordController,
                            hintText: 'Confirmer le mot de passe',
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            showPassword: true,
                            validator: (String? value) {
                              return Validators.passwordValidator(value!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.paddingMedium,
              vertical: AppTheme.paddingMedium,
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Vous avez déjà un compte ? ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurface.withOpacity(0.5),
                        ),
                    children: [
                      TextSpan(
                        text: 'Se connecter',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => context.navigator.pushNamed('/auth/login'),
                      ),
                    ],
                  ),
                ),
                const Spacing.large(),
                InkWell(
                  onTap: () => context.navigator.push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'En vous inscrivant, vous acceptez les ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color:
                                context.colorScheme.onSurface.withOpacity(0.5),
                          ),
                      children: [
                        TextSpan(
                          text: 'conditions générales d\'utilisation',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onSurface
                                        .withOpacity(0.8),
                                  ),
                        ),
                        TextSpan(
                          text: ' et la ',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onSurface
                                        .withOpacity(0.5),
                                  ),
                        ),
                        TextSpan(
                          text: 'politique de confidentialité',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onSurface
                                        .withOpacity(0.8),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacing.large(),
                BreakfreeButton(
                  label: 'Suivant',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final AuthService _authService = AuthService();
                      await _authService.register(
                        _emailController.text,
                        _passwordController.text,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetupView(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

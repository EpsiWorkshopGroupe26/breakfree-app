import 'package:breakfree/configs/themes/app_theme.dart';
import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/helpers/validators.dart';
import 'package:breakfree/pages/tabs/tab_screen.dart';
import 'package:breakfree/utils/services/auth_service.dart';
import 'package:breakfree/widgets/appbar.dart';
import 'package:breakfree/widgets/button.dart';
import 'package:breakfree/widgets/spacing.dart';
import 'package:breakfree/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      'Connexion',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const Spacing.small(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'Connectez-vous pour continuer',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onSurface
                                  .withOpacity(0.5),
                            ),
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
                        ],
                      ),
                    ),
                    const Spacing.large(),
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
                    text: 'Vous n\'avez pas de compte ? ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurface.withOpacity(0.5),
                        ),
                    children: [
                      TextSpan(
                        text: 'S\'inscrire',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              context.navigator.pushNamed('/auth/register'),
                      ),
                    ],
                  ),
                ),
                const Spacing.large(),
                BreakfreeButton(
                  label: 'Suivant',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final AuthService _authService = AuthService();
                      await _authService.login(
                        _emailController.text,
                        _passwordController.text,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabScreen(),
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

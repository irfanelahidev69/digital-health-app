import 'package:digital_health_app/core/extensions/context.dart';
import 'package:digital_health_app/features/auth/pages/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/component/app_custom_buttons.dart';
import '../../../core/component/custom_form_text_field.dart';
import '../../../core/utilities/colors.dart';
import '../../../core/utilities/strings.dart';
import '../../../core/utilities/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double height = 0;
  bool isVisible = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Container(
              height: context.height - context.height * 0.15 - kBottomNavigationBarHeight,
              padding: const EdgeInsets.symmetric(horizontal: 31),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      Strings.login,
                      style: context.headlineMedium.copyWith(fontWeight: FontWeight.w700, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: Strings.email,
                            textEditingController: _emailController,
                            errorText: Strings.pleaseEnterAValidEmail,
                            textFieldValidator: (value) {
                              if (!validateEmail(
                                _emailController.text.trim(),
                              )) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hintText: Strings.password,
                            obscureText: isVisible,
                            textEditingController: _passwordController,
                            errorText: Strings.pleaseEnterAValidPassword,
                            textFieldValidator: (value) {
                              if (!validatePassword(
                                _passwordController.text.trim(),
                              )) {
                                return '';
                              }

                              return null;
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(
                                isVisible ? Icons.visibility_off : Icons.visibility,
                                color: AppColors.kTextLightGreyColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "${Strings.forgotPassword}?",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppButton(
                            isProcessing: false,
                            onPressed: () async {},
                            child: Text(
                              Strings.login,
                              style: context.labelLarge.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.notRegistered,
                        style: context.bodyMedium.copyWith(color: AppColors.kTextLightGreyColor),
                      ),
                      InkWell(
                        onTap: () => context.push(const SignupScreen()),
                        child: Text(
                          Strings.createAccount,
                          style: context.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          Strings.bySigningIn,
                          style: context.bodyMedium.copyWith(color: AppColors.kTextLightGreyColor),
                        ),
                        // const CustomWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  init() {}
}

import 'package:digital_health_app/core/extensions/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/component/app_custom_buttons.dart';
import '../../../core/component/custom_form_text_field.dart';
import '../../../core/utilities/colors.dart';
import '../../../core/utilities/strings.dart';
import '../../../core/utilities/validators.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with Validators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final double height = 0;
  String? selectedUser;
  bool isVisible = true;
  bool visible = true;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController accountsController = TextEditingController();

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
                      Strings.createAccount,
                      style: context.headlineMedium.copyWith(fontWeight: FontWeight.w700, fontSize: 24.0),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: Strings.firstName,
                            textEditingController: firstNameController,
                            errorText: Strings.pleaseEnterAValidName,
                            textFieldValidator: (value) {
                              if (!validateName(
                                firstNameController.text.trim(),
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
                            hintText: Strings.lastName,
                            textEditingController: lastNameController,
                            errorText: Strings.pleaseEnterAValidName,
                            textFieldValidator: (value) {
                              if (!validateName(
                                lastNameController.text.trim(),
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
                            hintText: Strings.email,
                            textEditingController: emailController,
                            errorText: Strings.pleaseEnterAValidEmail,
                            textFieldValidator: (value) {
                              if (!validateEmail(emailController.text.trim())) {
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
                            textEditingController: passController,
                            errorText: Strings.pleaseEnterAValidPassword,
                            textFieldValidator: (value) {
                              if (!validatePassword(
                                passController.text.trim(),
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
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hintText: Strings.confirmPassword,
                            obscureText: visible,
                            textEditingController: confirmPassController,
                            errorText: Strings.passwordNotMatch,
                            textFieldValidator: (value) {
                              if (!validatePassword(confirmPassController.text)) {
                                return Strings.invalidConfirmPassword;
                              } else if (confirmPassController.text != passController.text) {
                                return Strings.confirmPasswordNotMatch;
                              }

                              return null;
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              child: Icon(
                                visible ? Icons.visibility_off : Icons.visibility,
                                color: AppColors.kTextLightGreyColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AppButton(
                            isProcessing: false,
                            onPressed: () async {},
                            child: Text(
                              Strings.signUp,
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
                        Strings.goBackTo,
                        style: context.bodyMedium.copyWith(color: AppColors.kTextLightGreyColor),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          Strings.login,
                          style: context.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

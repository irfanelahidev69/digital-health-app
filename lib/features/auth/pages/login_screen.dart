import 'package:digital_health_app/core/extensions/context.dart';
import 'package:digital_health_app/features/auth/pages/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/app_custom_buttons.dart';
import '../../../core/component/custom_dialog.dart';
import '../../../core/component/custom_form_text_field.dart';
import '../../../core/utilities/colors.dart';
import '../../../core/utilities/strings.dart';
import '../../../core/utilities/validators.dart';
import '../../home/screen/home_screen.dart';
import '../bloc/login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double height = 0;
  bool isVisible = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginBloc bloc = LoginBloc();

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
                          BlocConsumer<LoginBloc, LoginState>(
                            bloc: bloc,
                            listener: (context, state) {
                              if (state is LoginSuccessState) {
                                context.pushReplacement(const HomeScreen());
                              }
                              if (state is LoginGetUserState) {}
                              if (state is LoginFailedState) {
                                context.showAppDialog(
                                  CustomDialog(
                                    height: 40,
                                    content: Strings.error,
                                    description: state.errorCode != null ? "${state.message}" : state.message,
                                    actions: [
                                      CupertinoDialogAction(
                                        child: Text(
                                          Strings.ok,
                                          style: context.titleSmall,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (state is NoInternetState) {
                                context.showAppDialog(
                                  CustomDialog(
                                    height: 40,
                                    content: Strings.message,
                                    description: Strings.noInternetConnection,
                                    // icon: Assets.icons.closeIcon.path,
                                    actions: [
                                      CupertinoDialogAction(
                                        child: Text(
                                          Strings.retry,
                                          style: context.titleSmall,
                                        ),
                                        onPressed: () {
                                          bloc.add(
                                            UserLoginEvent(
                                              email: _emailController.text.trim(),
                                              password: _passwordController.text.trim(),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return AppButton(
                                isProcessing: state is LoginLoadingState ? true : null,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    bloc.add(
                                      UserLoginEvent(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text.trim(),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  Strings.login,
                                  style: context.labelLarge.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                                ),
                              );
                            },
                          ),
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
}

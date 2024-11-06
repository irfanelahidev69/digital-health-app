import 'package:digital_health_app/core/component/coutom_switch.dart';
import 'package:digital_health_app/core/extensions/context.dart';
import 'package:digital_health_app/features/home/bloc/check_in_bloc/check_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/component/app_custom_buttons.dart';
import '../../../core/component/custom_form_text_field.dart';
import '../../../core/utilities/colors.dart';
import '../../../core/utilities/strings.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({
    super.key,
  });

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  final TextEditingController noteController = TextEditingController();
  bool isSwitchOn = false;
  final CheckInBloc checkInBloc = CheckInBloc();
  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.gambledToday,
                      style: context.titleMedium,
                    ),
                    CustomSwitch(
                      inactiveColor: AppColors.kGreyColor,
                      onChanged: (value) {
                        setState(() {
                          isSwitchOn = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: key,
                  child: CustomTextFormField(
                    isEnabled: isSwitchOn,
                    hintText: Strings.enterNote,
                    textEditingController: noteController,
                    maxLines: 4,
                    borderColor: isSwitchOn ? AppColors.kOrangeColor : AppColors.kGreyColor,
                    errorText: Strings.pleaseEnterANote,
                    textFieldValidator: (value) {
                      if (noteController.text.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          BlocConsumer<CheckInBloc, CheckInState>(
            bloc: checkInBloc,
            listener: (context, state) {
              if (state is CheckInSuccessful) {
                noteController.clear();
                context.showToast(Strings.checkInSuccessful);
              } else if (state is CheckInUnsuccessful) {
                context.showToast(Strings.unableToCheckIn);
              } else if (state is NoInternet) {
                context.showToast(Strings.noInternetConnection);
              }
            },
            builder: (context, state) {
              return AppButton.outline(
                isProcessing: state is CheckInLoading,
                onPressed: isSwitchOn
                    ? () {
                        if (key.currentState!.validate()) {
                          checkInBloc.add(UserCheckInEvent(
                            note: noteController.text.trim(),
                          ));
                        }
                      }
                    : null,
                borderColor: isSwitchOn ? AppColors.kOrangeColor : AppColors.kGreyColor,
                child: Text(
                  Strings.submit,
                  style: context.labelLarge.copyWith(fontWeight: FontWeight.w600, color: isSwitchOn ? AppColors.kOrangeColor : AppColors.kGreyColor),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

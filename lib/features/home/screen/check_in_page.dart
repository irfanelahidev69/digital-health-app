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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Strings.userCheckIn,
            style: context.labelLarge.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.checkIn,
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
                CustomTextFormField(
                  hintText: Strings.enterNote,
                  textEditingController: noteController,
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
                        checkInBloc.add(UserCheckInEvent(
                          note: noteController.text.trim(),
                        ));
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

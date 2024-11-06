import 'package:digital_health_app/core/component/coutom_switch.dart';
import 'package:digital_health_app/core/extensions/context.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "User Check In",
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
                Form(
                  key: _key,
                  child: CustomTextFormField(
                    hintText: Strings.enterNote,
                    textEditingController: nameController,
                    errorText: Strings.pleaseEnterAValidNumber,
                    textFieldValidator: (value) {
                      if (nameController.text.trim().isEmpty) {
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
          AppButton.outline(
            isProcessing: false,
            onPressed: isSwitchOn ? () {} : null,
            borderColor: isSwitchOn ? AppColors.kOrangeColor : AppColors.kGreyColor,
            child: Text(
              Strings.submit,
              style: context.labelLarge.copyWith(fontWeight: FontWeight.w600, color: isSwitchOn ? AppColors.kOrangeColor : AppColors.kGreyColor),
            ),
          ),
        ],
      ),
    );
  }
}

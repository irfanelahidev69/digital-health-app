import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utilities/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String? errorText;
  final void Function(String value)? onChanged;
  final String? Function(String?)? textFieldValidator;
  final String? hintText;
  final TextInputType? inputType;
  final String? labelText;
  final bool obscureText;
  final TextEditingController? textEditingController;
  final bool isEnabled;
  final TextStyle? hintStyle;
  final int? maxLines;
  final bool? isSearch;
  final bool? kPrimaryColor;
  final FocusNode? node;
  final Widget? suffixIcon;
  final Color? textColor;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField(
      {this.errorText,
        this.hintText,
        this.node,
        this.labelText,
        this.inputType,
        this.obscureText = false,
        this.textEditingController,
        this.textFieldValidator,
        this.isEnabled = true,
        this.isSearch,
        this.kPrimaryColor,
        this.hintStyle,
        this.maxLines,
        this.textColor,
        super.key,
        this.onSaved,
        this.onChanged,
        this.inputFormatters,
        this.suffixIcon});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String value = "";

  String _onChanged(String string) {
    value = string;
    return string;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.textFieldValidator,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.kPrimaryColor != null ? AppColors.kOrangeColor : AppColors.kDarkGreyColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TextFormField(
                  inputFormatters: widget.inputFormatters,
                  cursorColor: AppColors.kOrangeColor,
                  autofocus: false,
                  onChanged: (s) {
                    _onChanged(s);
                    if (widget.onChanged != null) {
                      widget.onChanged!(s);
                    }
                  },
                  maxLines: widget.maxLines ?? 1,
                  style: TextStyle(color: widget.textColor ?? Colors.black, fontSize: 15),
                  enabled: widget.isEnabled,
                  keyboardType: widget.inputType,
                  controller: widget.textEditingController,
                  obscureText: widget.obscureText ? true : false,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: widget.suffixIcon ?? const SizedBox(),
                    ),
                    hintText: widget.hintText,
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(108, 108, 108, 1),
                      fontSize: 14,
                    ),
                    labelText: widget.labelText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            if (state.hasError)
              if (widget.errorText != null)
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.errorText!,
                        style: const TextStyle(color: Color.fromARGB(255, 255, 17, 0), fontSize: 12),
                      ),
                    ],
                  ),
                ),
          ],
        );
      },
    );
  }
}

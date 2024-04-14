import 'package:flutter/material.dart';

import '../presentation/styles/colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChange,
  Function? onTap,
  bool isPassword = false,
  bool isValidate = false,
  bool isPrefixText = false,
  Function? validate,
  String? label,
  Color inputColor = AppColor.primary,
  Color disabledColor = AppColor.primary,
  Color decoratedColor = AppColor.primary,
  Color textColor = AppColor.primary,
  prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  double borderRadius = 20.0,
  double fontSize = 16.0,
}) =>
    TextFormField(
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
      ),
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (_) => onSubmit!(_),
      onChanged: onChange,
      onTap: () => onTap,
      validator: (_) => validate!(_),
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: inputColor,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.error,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.error,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        labelText: label,
        labelStyle: TextStyle(fontSize: fontSize),
        prefixIcon: isPrefixText ? prefix : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: disabledColor,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: decoratedColor,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );

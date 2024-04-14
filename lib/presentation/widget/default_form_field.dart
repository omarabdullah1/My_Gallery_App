import 'package:flutter/material.dart';
import '../styles/colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChange,
  Function? onTap,
  String? hintText,
  bool isHint = false,
  bool isPassword = false,
  bool isValidate = false,
  bool isPrefixText = false,
  Function? validate,
  String? label,
  Color inputColor = AppColor.white,
  Color disabledColor = AppColor.white,
  Color decoratedColor = AppColor.white,
  Color textColor = AppColor.black,
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
        hintText: isHint ? hintText : null,
        hintStyle: isHint ? const TextStyle(color: Colors.grey) : null,
        filled: true,
        fillColor: AppColor.white,
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

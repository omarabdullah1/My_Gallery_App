
import 'package:flutter/material.dart';
import '../styles/colors.dart';

Widget dynamicFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChange,
  Function? onTap,
  bool isPassword = false,
  bool isValidate = false,
  bool isLabel = false,
  bool isBoarder = false,
  bool isIcon = false,
  Color? labelColor,
  Function? validate,
  String? label,
  IconData? prefix,
  IconData? suffixIcon,
  Color? suffixIconColor,
  Function? suffixPressed,
  bool isClickable = true,
  double borderRadius = 20.0,
  double fontSize = 16.0,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: isLabel ? label : null,
        labelStyle: TextStyle(
          color: labelColor ?? AppColor.defaultColor,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        ),
        alignLabelWithHint: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.defaultColor,
            width: 4.0,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.defaultColor,
            width: 4.0,
          ),
        ),
        suffixIcon: isIcon? IconButton(
          onPressed: () => suffixPressed!(),
          icon: Icon(
            suffixIcon,
            color: suffixIconColor,
          ),
        ):null,
      ),
      obscureText: isPassword,
      validator: (_) => isValidate?validate!(_):null,
      onFieldSubmitted: (_) => onSubmit!(_)?? '',
    );

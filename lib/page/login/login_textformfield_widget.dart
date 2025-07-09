import 'package:flutter/material.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';

class LoginTextformfieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Icon? suffixIcon;
  const LoginTextformfieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      style: regular.copyWith(color: Color(0xFF8c8c8c)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: regular.copyWith(color: foundationGreyColor),
        prefixIcon: Icon(prefixIcon, color: foundationGreyColor),
        suffixIcon: suffixIcon,
        suffixIconColor: foundationGreyColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xffD0D3D9)),
        ),
      ),
    );
  }
}

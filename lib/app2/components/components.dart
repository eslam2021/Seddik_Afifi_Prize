import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget customDropDownButtonFormField({
  String? value,
  double? itemHeight,
  TextStyle? hintStyle,
  Widget? hint,
  String? hintText,
  Widget? disabledHint,
  double menuMaxHeight = 200,
  double? fontSize,
  required Function(Object?)? onChanged,
  required List<String> items,
  String? Function(dynamic)? validator,
  EdgeInsetsGeometry? contentPadding =
      const EdgeInsets.symmetric(horizontal: 10),
  EdgeInsetsGeometry? margin =
      const EdgeInsets.only(left: 20, right: 20, top: 5),
}) =>
    Container(
      margin: margin,
      child: DropdownButtonFormField(
        itemHeight: itemHeight,
        menuMaxHeight: menuMaxHeight,
        disabledHint: disabledHint,
        value: value,
        onChanged: onChanged,
        validator: validator,
        hint: hint,
        iconDisabledColor: Colors.grey,
        decoration: InputDecoration(
          hintStyle: hintStyle,
          hintText: hintText,
          contentPadding: contentPadding,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          );
        }).toList(),
      ),
    );
void showToast({
  required String text,
  required Color color,
  required int time,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: time,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
Widget defaultFormField({
  TextEditingController? controller,
  TextInputType? type,
  Function(String title)? onSubmit,
  Function(String title)? onChange,
  Function(String? title)? validate,
  bool isPassword = false,
  int? Maxlength,
  String? label,
  String? hint,
  IconData? prefix,
  Function()? suffixPressed,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      maxLength: Maxlength,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: (T) => validate!(T),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: Color(0xff647295),
          fontFamily: 'ElMessiri',
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          prefix,
          color: Color(0xff647295),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix, color: Color(0xff647295)),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff647295), width: 3.0),
          borderRadius: BorderRadius.circular(18.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff647295), width: 3.0),
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );

class IconItem {
  final String urlImage;
  const IconItem({required this.urlImage});
}

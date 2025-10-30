import 'package:flutter/material.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';

import '../utils/constraints.dart';
import '../utils/utils.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final T? value;
  final String hintText;
  final List<T>? items;
  final Function(T?)? onChanged;
  final Color? dFillColor;
  final Color? dBorderColor;
  final Color? dropdownColor;
  final double? borderRadius;
  final Widget Function(T) itemBuilder;

  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    this.dFillColor,
    this.dBorderColor,
    this.dropdownColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      hint: CustomText(text: hintText, fontSize: 14.0, color: sTxtColor),
      isDense: true,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: Utils.borderRadius(r: 4.0),
          borderSide: BorderSide(color: dTextColor.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: Utils.borderRadius(r: 4.0),
          borderSide: BorderSide(color: dTextColor.withOpacity(0.1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: Utils.borderRadius(r: 4.0),
          borderSide: BorderSide(color: dTextColor.withOpacity(0.1)),
        ),
        fillColor: dFillColor ?? const Color(0xFFF8FAFC),
        filled: true,
        focusColor: borderColor,
      ),
      dropdownColor: dropdownColor ?? whiteColor,
      borderRadius: Utils.borderRadius(r: 4.0),
      onChanged: onChanged,
      items:
          items?.map((T item) {
            return DropdownMenuItem<T>(value: item, child: itemBuilder(item));
          }).toList(),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hkorn_new/ui/shared/base_colors.dart';
import 'package:hkorn_new/ui/shared/base_fonts.dart';
import 'package:ui_helper/ui_helper.dart';

class DropdownExtended extends StatelessWidget {
  final String title;
  final Function onChanged;
  final List<String> items;

  DropdownExtended(
      {Key? key,
      required this.title,
      required this.onChanged,
      required this.items})
      : super(key: key);

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: BaseFonts.headline2(fontSize: 16)),
        verticalSpaceSmall,
        DropdownButtonFormField2(
          focusColor: BaseColors.primaryColor,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          isExpanded: true,
          hint: Text(
            title,
            style:
                BaseFonts.subHead(fontSize: 14, color: BaseColors.labelColor),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: BaseColors.primaryColor,
          ),
          iconSize: 30,
          buttonHeight: 60,
          buttonPadding: const EdgeInsets.only(left: 20, right: 10),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select from the dropdown.';
            }
            return null;
          },
          onChanged: (val) => onChanged(val),
          onSaved: (value) {
            selectedValue = value.toString();
          },
        ),
      ],
    );
  }
}

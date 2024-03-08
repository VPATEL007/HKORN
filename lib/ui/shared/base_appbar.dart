import 'package:flutter/material.dart';
import 'package:hkorn_new/ui/shared/base_colors.dart';

import 'base_fonts.dart';

class BaseAppbar extends AppBar {
  BaseAppbar(
      {Key? key,
      required title,
      required BuildContext context,
      List<Widget>? action,
      Color? color,
      automaticallyImplyLeading = true})
      : super(
          key: key,
          backgroundColor: BaseColors.white,
          elevation: 0,
          actions: action,
          centerTitle: true,
          leading: !automaticallyImplyLeading
              ? null
              : IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 28,
                  )),
          automaticallyImplyLeading: automaticallyImplyLeading,
          iconTheme: const IconThemeData(color: BaseColors.primaryColor),
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: BaseFonts.headline().copyWith(color: color),
          ),
        );
}

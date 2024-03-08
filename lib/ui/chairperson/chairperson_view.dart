import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hkorn_new/ui/chairperson/chairperson_viewmodel.dart';
import 'package:hkorn_new/ui/shared/base_appbar.dart';
import 'package:hkorn_new/ui/shared/base_colors.dart';
import 'package:hkorn_new/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';

import '../shared/widgets/memebership_widget.dart';

class ChairPersonView extends StatelessWidget {
  const ChairPersonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChairPersonViewModel>.reactive(
        viewModelBuilder: () => ChairPersonViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                title: 'Message from Chairperson',
                context: context,
              ),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              children: [
                                Text(
                                  'Message from Chairperson',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  height: 36,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          color: const Color(0xffE2DFDF))),
                                  alignment: Alignment.center,
                                  child: DropdownButton<String>(
                                    value: model.dropdownValue,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: BaseColors.primaryColor),
                                    elevation: 16,
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.transparent,
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      model.dropdownValue = value!;
                                    },
                                    items: model.list
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Html(
                              data: model.chairPersonModel?.post_content ?? '',
                              tagsList: Html.tags,
                              style: {
                                'i': Style(
                                    fontSize: const FontSize(18),
                                    fontWeight: FontWeight.w700,
                                    textAlign: TextAlign.center,
                                    fontStyle: FontStyle.normal,
                                    color: BaseColors.primaryColor),
                                'h1': Style(
                                    fontSize: const FontSize(14),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.transparent),
                              },
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                              child: MembershipWidget())
                        ],
                      ),
                    ),
            ));
  }
}

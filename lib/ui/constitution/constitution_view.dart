import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hkorn_new/const/images_const.dart';
import 'package:hkorn_new/ui/constitution/constitution_viewmodel.dart';
import 'package:hkorn_new/ui/shared/base_appbar.dart';
import 'package:hkorn_new/ui/shared/base_colors.dart';
import 'package:hkorn_new/ui/shared/widgets/memebership_widget.dart';
import 'package:hkorn_new/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';

class ConstituionView extends StatelessWidget {
  const ConstituionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ConstitutionViewModel>.reactive(
        viewModelBuilder: () => ConstitutionViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                title: 'Constitution',
                context: context,
              ),
              body: model.isBusy
                  ? loadingSpinnerWidget
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Image.asset(Images.constituionImage),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: model.reverseConstitutionList.length,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                  leading: const Icon(Icons.add_circle,
                                      color: Color(0xff3FDBB1)),
                                  onExpansionChanged: (value) {},
                                  trailing: const SizedBox(),
                                  title: Text(
                                    model.reverseConstitutionList[index]
                                        .post_title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff0F2137)),
                                  ),
                                  children: [
                                    Html(
                                      data: model.reverseConstitutionList[index]
                                          .post_content,
                                      tagsList: Html.tags,
                                      style: {
                                        'h3': Style(
                                            fontSize: const FontSize(12.0),
                                            fontWeight: FontWeight.w600),
                                        'li': Style(
                                            fontSize: const FontSize(10),
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff343D48)),
                                        'div': Style(
                                            fontSize: const FontSize(10),
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff343D48)),
                                        'ol': Style(
                                            fontSize: const FontSize(10),
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff343D48)),
                                      },
                                    )
                                  ]);
                            },
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

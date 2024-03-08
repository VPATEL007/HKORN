import 'package:flutter/material.dart';
import 'package:hkorn_new/ui/search/search_viewmodel.dart';
import 'package:hkorn_new/ui/shared/base_appbar.dart';
import 'package:hkorn_new/ui/shared/base_colors.dart';
import 'package:hkorn_new/ui/shared/base_fonts.dart';
import 'package:hkorn_new/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
        viewModelBuilder: () => SearchViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: BaseColors.white,
              appBar: BaseAppbar(
                context: context,
                automaticallyImplyLeading: false,
                title: "Search",
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10, top: 20),
                      child: TextField(
                        controller: model.searchController,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: model.search,
                            child: const Icon(Icons.search),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFE5E7EB).withOpacity(0.2),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: 'Search ',
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recent Search",
                                textAlign: TextAlign.center,
                                style: BaseFonts.headline(fontSize: 14)),
                            GestureDetector(
                              onTap: () {},
                              child: Text("Clear All",
                                  textAlign: TextAlign.center,
                                  style: BaseFonts.headline(
                                      color: BaseColors.primaryColor,
                                      fontSize: 12)),
                            ),
                          ],
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                      child: recentSearch(model, context),
                    ),
                    verticalSpaceMedium,
                    model.isBusy
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 4),
                            child: loadingSpinnerWidget,
                          )
                        : model.result == null
                            ? Container()
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.result!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model.result![index].post_title,
                                          style: BaseFonts.subHead(),
                                        ),
                                        const Divider(),
                                      ],
                                    ),
                                  );
                                }),
                  ],
                ),
              ),
            ));
  }

  Widget recentSearch(SearchViewModel model, BuildContext context) {
    return model.recentSearchItems.isEmpty
        ? Container()
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ListView.builder(
                itemCount: model.recentSearchItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FilterChip(
                    label: Text(model.recentSearchItems[index]),
                    backgroundColor: const Color(0xFF898A8D).withOpacity(0.1),
                    shape: const StadiumBorder(
                        side: BorderSide(color: Color(0xFF898A8D))),
                    onSelected: (bool value) {},
                  );
                }),
          );
    // return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    //   FilterChip(
    //     label: const Text("Events"),
    //     backgroundColor: const Color(0xFF898A8D).withOpacity(0.1),
    //     shape: const StadiumBorder(side: BorderSide(color: Color(0xFF898A8D))),
    //     onSelected: (bool value) {
    //       print("selected");
    //     },
    //   ),
    //   horizontalSpaceSmall,
    //   FilterChip(
    //     label: const Text("members"),
    //     backgroundColor: const Color(0xFF898A8D).withOpacity(0.1),
    //     shape: const StadiumBorder(side: BorderSide(color: Color(0xFF898A8D))),
    //     onSelected: (bool value) {
    //       print("selected");
    //     },
    //   ),
    //   horizontalSpaceSmall,
    //   FilterChip(
    //     label: const Text("Health"),
    //     backgroundColor: const Color(0xFF898A8D).withOpacity(0.1),
    //     shape: const StadiumBorder(side: BorderSide(color: Color(0xFF898A8D))),
    //     onSelected: (bool value) {
    //       print("selected");
    //     },
    //   ),
    //   horizontalSpaceSmall,
    //   FilterChip(
    //     label: const Text("Food"),
    //     backgroundColor: const Color(0xFF898A8D).withOpacity(0.1),
    //     shape: const StadiumBorder(side: BorderSide(color: Color(0xFF898A8D))),
    //     onSelected: (bool value) {
    //       print("selected");
    //     },
    //   ),
    // ]);
  }
}

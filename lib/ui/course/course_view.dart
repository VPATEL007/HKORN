import 'package:flutter/material.dart';
import 'package:hkorn_new/ui/course/course_viewmodel.dart';
import 'package:hkorn_new/ui/shared/base_appbar.dart';
import 'package:hkorn_new/ui/shared/base_colors.dart';
import 'package:hkorn_new/ui/shared/base_fonts.dart';
import 'package:hkorn_new/ui/shared/base_image.dart';
import 'package:hkorn_new/ui/shared/widgets/spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_helper/ui_helper.dart';

class CourseView extends StatelessWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CourseViewModel>.reactive(
      viewModelBuilder: () => CourseViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: BaseAppbar(
          context: context,
          title: 'Courses',
          action: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        backgroundColor: BaseColors.white,
        body: model.isBusy
            ? loadingSpinnerWidget
            : Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "All Courses",
                                textAlign: TextAlign.center,
                                style: BaseFonts.headline(),
                              ),
                              horizontalSpaceSmall,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFFBD41),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  model.coursed.length.toString(),
                                  style: BaseFonts.subHead(
                                      color: BaseColors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (BuildContext context) => Notification_page()));
                            },
                            icon: const Icon(Icons.filter_alt_rounded),
                            color: BaseColors.primaryColor,
                          ),
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 20,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.25),
                          crossAxisCount: 2,
                        ),
                        itemCount: model.coursed.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              model.openCourseView(model.coursed[index].id);
                            },
                            child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: BaseColors.greyColor)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0)),
                                          child: BaseImage(
                                              url: model.coursed[index].image,
                                              height: 124,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width),
                                        ),
                                        Positioned(
                                          right: 10,
                                          top: 5,
                                          child: Container(
                                            width: 50,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFFFBD41),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "FREE",
                                                style: BaseFonts.subHead(
                                                    fontSize: 12,
                                                    color: BaseColors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    verticalSpaceSmall,
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('9 Lessons',
                                          style: TextStyle(
                                              color: Color(0xff979797),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          verticalSpaceTiny,
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                                model.coursed[index].title,
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color:
                                                        BaseColors.primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                          ),
                                          verticalSpaceSmall,
                                          Text('Aim of the Course',
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: BaseFonts.footNote2(
                                                  color: BaseColors.greyColor,
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

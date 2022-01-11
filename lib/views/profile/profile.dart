import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/profilecontroller.dart';
import 'package:insta_layout/views/profile/allposts.dart';
import 'package:insta_layout/views/profile/alltags.dart';
import 'package:insta_layout/views/profile/allvideos.dart';
import 'package:insta_layout/views/profile/stickyheaderwidget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.1,
            backgroundColor: isnotDarkMode(),
            title: Row(
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 15.h,
                ),
                SizedBox(
                  width: 8.w,
                ),
                const Text("Username0"),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 16.h,
                    ))
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: thatWeirdWidget(),
                    ),
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver:
                          // const SliverToBoxAdapter(
                          //     child: TabBar(
                          //   tabs: [
                          //     Tab(
                          //       icon: Icon(Icons.grid_on_sharp),
                          //     ),
                          //     Tab(
                          //       icon: Icon(Icons.play_arrow_outlined),
                          //     ),
                          //     Tab(
                          //       icon: Icon(Icons.assignment_ind_outlined),
                          //     )
                          //   ],
                          // ))
                          const StickyHeaderWidget(),
                    ),
                  ],
              body: TabBarView(children: [
                Builder(builder: (BuildContext context) {
                  return CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context)),
                      SliverToBoxAdapter(
                        child: AllPosts(),
                      )
                    ],
                  );
                }),
                Builder(builder: (BuildContext context) {
                  return CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context)),
                      SliverToBoxAdapter(
                        child: AllVideos(),
                      )
                    ],
                  );
                }),
                Builder(builder: (BuildContext context) {
                  return CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context)),
                      SliverToBoxAdapter(
                        child: AllTags(),
                      )
                    ],
                  );
                })
              ])

              // Builder(builder: (BuildContext context) {
              //   return CustomScrollView(
              //     slivers: [
              //       SliverOverlapInjector(
              //           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
              //               context)),
              //       SliverToBoxAdapter(
              //           child: ObxValue((RxInt rxInt) {
              //         if (rxInt.value == 2) {
              //           return const AllVideos();
              //         } else if (rxInt.value == 3) {
              //           return const AllTags();
              //         } else {
              //           return const AllPosts();
              //         }
              //       }, controller.tab)),
              //     ],
              //   );
              // }))
              //  ObxValue((RxInt rxInt) {
              //   if (rxInt.value == 2) {
              //     return const AllVideos();
              //   } else if (rxInt.value == 3) {
              //     return const AllTags();
              //   } else {
              //     return const AllPosts();
              //   }
              // }, controller.tab)),
              ),
        ));
  }

  Widget thatWeirdWidget() {
    return Padding(
      padding: allPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              profileImage(45, Constants.user0),
              SizedBox(width: 40.w),
              figure(22, "Posts"),
              SizedBox(width: 23.w),
              figure(22, "Followers"),
              SizedBox(width: 15.w),
              figure(22, "Following"),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            Constants.user0.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Edit profile"),
                style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    elevation: MaterialStateProperty.all(0.0),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade300)),
                    minimumSize:
                        // TODO: 305.w
                        MaterialStateProperty.all<Size>(Size(300.w, 35.h))),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 16.h,
                ),
                style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    elevation: MaterialStateProperty.all(0.0),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade300)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(38.w, 35.h))),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(children: [
            Expanded(
                child: Text(
              "Story highlights",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
            )),
            Icon(
              Icons.keyboard_arrow_down,
              size: 16.h,
            ),
          ])
        ],
      ),
    );
  }

  Widget figure(int figure, String type) {
    return Column(
      children: [
        Text(
          figure.toString(),
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        Text(type)
      ],
    );
  }
}

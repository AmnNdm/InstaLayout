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
              IconButton(
                  onPressed: () {
                    Get.bottomSheet(addBottomSheet(),
                        backgroundColor:
                            MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Colors.grey.shade900
                                : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r))));
                  },
                  icon: const Icon(Icons.add_box_outlined)),
              IconButton(
                  onPressed: () {
                    Get.bottomSheet(menuBottomSheet(),
                        backgroundColor:
                            MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Colors.grey.shade900
                                : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r))));
                  },
                  icon: const Icon(Icons.menu))
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: thatWeirdWidget(),
                    ),
                    // make this widget stick through SliverOverlapAbsorber with SliverPersistentHeader
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: const StickyHeaderWidget(),
                    ),
                  ],
              body: TabBarView(children: [
                tab(const AllPosts()),
                tab(const AllVideos()),
                tab(const AllTags())
              ])),
        ));
  }

  Widget tab(Widget child) {
    return Builder(builder: (BuildContext context) {
      return CustomScrollView(
        slivers: [
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverToBoxAdapter(
            child: child,
          )
        ],
      );
    });
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
              // TODO: 305.w
              button(const Text("Edit profile"), Size(300.w, 35.h), () => null),
              button(
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16.h,
                  ),
                  Size(38.w, 35.h),
                  () => null),
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

  Widget button(Widget child, Size size, Function()? onClicked) {
    return ElevatedButton(
      onPressed: onClicked,
      child: child,
      style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(0.0),
          side: MaterialStateProperty.all(
              BorderSide(color: Colors.grey.shade300)),
          minimumSize: MaterialStateProperty.all<Size>(size)),
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

  Widget addBottomSheet() {
    var dividerLine = Padding(
      padding: EdgeInsets.fromLTRB(54.w, 0.0, 12.w, 0.0),
      child: const Divider(
        height: 0,
      ),
    );
    return Container(
      height: 305.h,
      padding: EdgeInsets.fromLTRB(0.0, 10.h, 0.0, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          silverDash(),
          SizedBox(
            height: 14.h,
          ),
          Center(
            child: Text(
              "Create",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Divider(
            height: 0,
          ),
          createRow(Icons.grid_on_sharp, "Post"),
          dividerLine,
          createRow(Icons.add_circle_outline, "Story"),
          dividerLine,
          createRow(Icons.favorite_border_rounded, "Story Highlight"),
          dividerLine,
          createRow(Icons.podcasts, "Live"),
          dividerLine,
        ],
      ),
    );
  }

  createRow(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24.h,
          ),
          SizedBox(
            width: 14.w,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  Widget menuBottomSheet() {
    var space = SizedBox(
      height: 18.h,
    );
    return Container(
      height: 320.h,
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 10.w, 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          silverDash(),
          SizedBox(
            height: 20.h,
          ),
          menuRow(Icons.settings_outlined, "Settings"),
          space,
          menuRow(Icons.archive_outlined, "Archive"),
          space,
          menuRow(Icons.local_activity_outlined, "Your Activity"),
          space,
          menuRow(Icons.qr_code, "QR code"),
          space,
          menuRow(Icons.bookmark_outline, "Saved"),
          space,
          menuRow(Icons.list, "Close Friends"),
          space,
          menuRow(
              Icons.health_and_safety_outlined, "COVID-19 Information Center"),
        ],
      ),
    );
  }

  menuRow(IconData icon, String text) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 26,
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

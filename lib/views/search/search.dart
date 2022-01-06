import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_layout/components/appbar.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/searchcontroller.dart';
import 'package:insta_layout/views/search/searchcontent.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'explore.dart';
import 'suggestions.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  MyAppBar(
                      title: searchBar(
                          page: const SearchContent(),
                          withNavbar: true,
                          context: context))
                ],
            body: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return tiles(controller.left.toggle().value, context);
                })));
  }

  tiles(bool left, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        children: [
          left ? suggestionTile("S", context) : exploreTile("E", context),
          left ? exploreTile("E", context) : suggestionTile("S", context),
          exploreTile("E", context),
          exploreTile("E", context),
          exploreTile("E", context),
          exploreTile("E", context),
          exploreTile("E", context),
          exploreTile("E", context),
          exploreTile("E", context),
        ],
      ),
    );
  }

  exploreTile(String type, BuildContext context) {
    return StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: GestureDetector(
            onTap: () {
              pushNewScreen(context, screen: const Explore(), withNavBar: true);
            },
            child: Tile(
              type: type,
            )));
  }

  suggestionTile(String type, BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: GestureDetector(
          onTap: () => pushNewScreen(context,
              screen: const Suggestion(), withNavBar: true),
          child: Tile(type: type)),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.type,
    this.extent,
    this.bottomSpace,
  }) : super(key: key);

  final String type;
  final double? extent;
  final double? bottomSpace;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: const Color(0xFF34568B),
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text(type, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    return Column(
      children: [
        Expanded(child: child),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/others/components.dart';
import 'package:insta_layout/search/explore.dart';
import 'package:insta_layout/search/explorevideos.dart';
import 'package:insta_layout/search/searchcontent.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_layout/search/searchcontroller.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

// List<StaggeredGridTile> _staggeredTiles = const <StaggeredGridTile>[
//   StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: _Example01Tile(Colors.green, Icons.widgets)),

//   const StaggeredTile.count(2, 2),
//   const StaggeredTile.count(2, 1),
//   const StaggeredTile.count(1, 2),
//   const StaggeredTile.count(1, 1),
//   const StaggeredTile.count(2, 2),
//   const StaggeredTile.count(1, 2),
//   const StaggeredTile.count(1, 1),
//   const StaggeredTile.count(3, 1),
//   const StaggeredTile.count(1, 1),
//   const StaggeredTile.count(4, 1),
// ];

// List<Widget> _tiles = const <Widget>[
//   const _Example01Tile(Colors.green, Icons.widgets),
//   const _Example01Tile(Colors.lightBlue, Icons.wifi),
//   const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
//   const _Example01Tile(Colors.brown, Icons.map),
//   const _Example01Tile(Colors.deepOrange, Icons.send),
//   const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
//   const _Example01Tile(Colors.red, Icons.bluetooth),
//   const _Example01Tile(Colors.pink, Icons.battery_alert),
//   const _Example01Tile(Colors.purple, Icons.desktop_windows),
//   const _Example01Tile(Colors.blue, Icons.radio),
// ];

class SearchScreen extends GetView<SearchController> {
  SearchScreen({Key? key}) : super(key: key) {
    Get.put(SearchController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  appbar(
                      searchBar(
                          page: const SearchContent(),
                          withNavbar: true,
                          context: context),
                      sliver: true)
                ],
            body:
                // SingleChildScrollView(
                //   child: Column(
                //     children: [
                //       tiles(controller.left.toggle().value),
                //       tiles(controller.left.toggle().value)
                //     ],
                //   ),
                // )
                ListView.builder(
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
              pushNewScreen(context, screen: Explore(), withNavBar: true);
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
          onTap: () =>
              pushNewScreen(context, screen: Suggestion(), withNavBar: true),
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

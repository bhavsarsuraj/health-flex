import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_flex/app/utils/enums.dart';
import 'package:health_flex/app/widgets/gif_card.dart';

import '../controllers/trending_gifs_controller.dart';

class TrendingGifsView extends GetView<TrendingGifsController> {
  const TrendingGifsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending'),
        centerTitle: true,
      ),
      body: Obx(() {
        switch (controller.gifsState) {
          case WidgetState.initial:
          case WidgetState.loading:
            return Text('Fetching data');
          case WidgetState.error:
            //TODO:
            return Container();
          case WidgetState.success:
            return _Body();
        }
      }),
    );
  }
}

class _Body extends GetView<TrendingGifsController> {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _GifsGrid();
  }
}

class _GifsGrid extends GetView<TrendingGifsController> {
  const _GifsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2,
      children:
          controller.trendingGIFs.map((gif) => GIFCard(gif: gif)).toList(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 20,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_flex/app/utils/enums.dart';
import 'package:health_flex/app/widgets/gif_card.dart';
import 'package:health_flex/app/widgets/paginated_view.dart';
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
          case PaginatedWidgetState.initial:
          case PaginatedWidgetState.loading:
            return Center(child: CircularProgressIndicator());
          case PaginatedWidgetState.error:
            return Center(
              child: ElevatedButton(
                onPressed: controller.getTrendingGIFs,
                child: Text('Try Again'),
              ),
            );
          case PaginatedWidgetState.paginationLoading:
          case PaginatedWidgetState.success:
          case PaginatedWidgetState.paginationError:
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
    return Obx(
      () => PaginatedView(
        paginatedWidgetState: controller.gifsState,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 2,
          children:
              controller.trendingGIFs.map((gif) => GIFCard(gif: gif)).toList(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 20,
        ),
        hasMoreData: controller.hasMoreData,
        reloadData: controller.getTrendingGIFs,
      ),
    );
  }
}

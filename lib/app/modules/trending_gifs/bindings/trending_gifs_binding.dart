import 'package:get/get.dart';

import '../controllers/trending_gifs_controller.dart';

class TrendingGifsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingGifsController>(
      () => TrendingGifsController(),
    );
  }
}
